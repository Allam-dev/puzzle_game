import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hack_puzzle/core/usecases/no_params.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';
import 'package:hack_puzzle/features/puzzle/domain/usecases/get_all_puzzles.dart';
import 'package:hack_puzzle/features/puzzle/domain/usecases/update_puzzle.dart';
import 'package:hack_puzzle/injection.dart';
import 'package:hack_puzzle/presentation/app/cubit/app_cubit.dart';
import 'package:hack_puzzle/presentation/navigation/app_navigator.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';
import 'package:hack_puzzle/presentation/screens/game/ui/game_screen.dart';
import 'package:meta/meta.dart';
part 'all_levels_state.dart';

class AllLevelsCubit extends Cubit<AllLevelsState> {
  AllLevelsCubit({required this.getAllLevels})
      : super(const AllLevelsInitial()) {
    getPuzzles();
  }

  final GetAllPuzzles getAllLevels;

  Future<void> getPuzzles() async {
    emit(const AllLevelsLoading());
    final eitherPuzzles = await getAllLevels(const NoParams());
    eitherPuzzles.fold(
      (failure) {
        emit(const AllLevelsError(
            message: "Error in database call technical support"));
      },
      (puzzles) {
        emit(AllLevelsLoaded(puzzles: puzzles));
      },
    );
  }

  Future<void> setLanguage(Locale locale) async {
    await getIt<AppCubit>().changeLanguage(locale);
  }

  void gotoGameScreen({required Puzzle puzzle}) {
    getIt.registerLazySingleton(
        () => GameCubit(updatePuzzle: getIt<UpdatePuzzle>()));
    getIt<GameCubit>().puzzle = puzzle;
    AppNavigator.push(routeName: const GameScreen().route);
  }
}
