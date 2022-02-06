import 'package:bloc/bloc.dart';
import 'package:hack_puzzle/core/usecases/no_params.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';
import 'package:hack_puzzle/features/puzzle/domain/usecases/get_all_puzzles.dart';
import 'package:meta/meta.dart';
part 'all_puzzles_state.dart';

class AllPuzzlesCubit extends Cubit<AllPuzzlesState> {
  AllPuzzlesCubit({required this.getAllPuzzles}) : super(const AllPuzzlesInitial());

  final GetAllPuzzles getAllPuzzles;

  Future<void> getPuzzles() async {
    emit(const AllPuzzlesLoading());
    final eitherPuzzles = await getAllPuzzles(const NoParams());
    eitherPuzzles.fold(
      (failure) {
        emit(const AllPuzzlesError(message: "Error in database call technical support"));
      },
      (puzzles) {
        emit(AllPuzzlesLoaded(puzzles: puzzles));
      },
    );
  }
}
