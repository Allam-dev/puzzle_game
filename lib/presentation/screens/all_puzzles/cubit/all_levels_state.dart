// ignore_for_file: must_be_immutable

part of 'all_levels_cubit.dart';

@immutable
abstract class AllLevelsState {
  const AllLevelsState();
}

class AllLevelsInitial extends AllLevelsState {
  const AllLevelsInitial();
}

class AllLevelsError extends AllLevelsState {
  final String message;
  const AllLevelsError({required this.message});

}

class AllLevelsLoading extends AllLevelsState {
  const AllLevelsLoading();
}

class AllLevelsLoaded extends AllLevelsState {
  List<Puzzle> puzzles;
  AllLevelsLoaded({required this.puzzles});
}
