part of 'all_puzzles_cubit.dart';

@immutable
abstract class AllPuzzlesState {
  const AllPuzzlesState();
}

class AllPuzzlesInitial extends AllPuzzlesState {
  const AllPuzzlesInitial();
}

class AllPuzzlesError extends AllPuzzlesState {
  final String message;
  const AllPuzzlesError({required this.message});

}

class AllPuzzlesLoading extends AllPuzzlesState {
  const AllPuzzlesLoading();
}

class AllPuzzlesLoaded extends AllPuzzlesState {
  List<Puzzle> puzzles;
  AllPuzzlesLoaded({required this.puzzles});
}
