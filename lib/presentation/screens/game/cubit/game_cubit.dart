import 'package:bloc/bloc.dart';
import 'package:hack_puzzle/core/extraction_methods/list/is_win.dart';
import 'package:hack_puzzle/core/extraction_methods/list/play.dart';
import 'package:hack_puzzle/core/helpers/debugging/log.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';
import 'package:hack_puzzle/features/puzzle/domain/usecases/update_puzzle.dart';
import 'package:hack_puzzle/injection.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/cubit/all_levels_cubit.dart';
import 'package:meta/meta.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  late Puzzle _puzzle;
  late Puzzle _nextPuzzle;
  StopWatchTimer? _stopWatchTimer;
  int _steps = 0;
  int _time = 0;
  bool _runTimer = false;
  UpdatePuzzle updatePuzzle;

  GameCubit({required this.updatePuzzle}) : super(GameInitial());

  Future<void> play(int index) async {
    _puzzle.list.play(
        index: index,
        afterPlay: () {
          if (_runTimer == false) {
            _runTimer = true;
            _stopWatchTimer = StopWatchTimer(
                mode: StopWatchMode.countUp,
                onChangeRawSecond: (value) {
                  Log.debug("$value");
                  _time = value;
                  emit(GameLoad());
                });
            _stopWatchTimer?.onExecute.add(StopWatchExecute.start);
          }
          _steps++;
          if (puzzle.list.isWin() == true) {
            _puzzle.steps = _steps;
            _puzzle.timeBySec = _time;
            updatePuzzle(UpdatePuzzleParams(puzzle: _puzzle)).then((either) {
              either.fold((l) => emit(GameCrash()), (r) {
                _nextPuzzle = Puzzle(
                    id: _puzzle.id + 1,
                    columns: _puzzle.columns + 1,
                    rows: _puzzle.rows + 1,
                    isOpen: true);
                updatePuzzle(UpdatePuzzleParams(puzzle: _nextPuzzle))
                    .then((either) {
                  either.fold((l) => emit(GameCrash()), (r) async {
                    _stopWatchTimer?.onExecute.add(StopWatchExecute.stop);
                    await getIt<AllLevelsCubit>().getPuzzles();
                    emit(GameLoad());
                    emit(GameWin());
                  });
                });
              });
            });
          } else {
            emit(GameLoad());
          }
        });
  }

  void nextLevel(){
    _puzzle = _nextPuzzle;
    _puzzle.createList();
    restart();
  }

  void restart() {
    _puzzle.list.shuffle();
    _steps = 0;
    _runTimer = false;
    _time = 0;
    _stopWatchTimer?.onExecute.add(StopWatchExecute.reset);
    emit(GameLoad());
  }

  Puzzle get puzzle => _puzzle;

  set puzzle(Puzzle puzzle) {
    _puzzle = puzzle;
    _puzzle.createList();
  }

  int get time => _time;
  int get steps => _steps;

  @override
  Future<void> close() async {
    await _stopWatchTimer?.dispose();
    return super.close();
  }
}
