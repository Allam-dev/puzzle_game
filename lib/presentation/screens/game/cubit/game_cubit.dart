import 'package:bloc/bloc.dart';
import 'package:hack_puzzle/core/extraction_methods/list/is_win.dart';
import 'package:hack_puzzle/core/extraction_methods/list/play.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';
import 'package:hack_puzzle/features/puzzle/domain/usecases/update_puzzle.dart';
import 'package:meta/meta.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  late Puzzle _puzzle;
  int _steps = 0;
  UpdatePuzzle updatePuzzle;

  GameCubit({required this.updatePuzzle}) : super(GameInitial());

  void play(int index) async {
    puzzle.list.play(index);
    if (puzzle.list.isWin() == true) {
      updatePuzzle(UpdatePuzzleParams(puzzle: puzzle)).then((either) {
        either.fold((l) => GameCrash(), (r) {
          emit(GameLoadBoard());
          emit(GameWin());

          // emit(I)
        });
      });
    } else {
      emit(GameLoadBoard());
    }
  }

  void reload() {
    puzzle.list.shuffle();
    emit(GameLoadBoard());
  }

  Puzzle get puzzle => _puzzle;

  set puzzle(Puzzle puzzle) {
    _puzzle = puzzle;
    _puzzle.createList();
  }

  int get steps{
    return _steps;
    emit(state);
  }
}
