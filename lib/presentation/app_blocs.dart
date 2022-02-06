import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack_puzzle/features/puzzle/data/data_sources/local/puzzle_database_source.dart';
import 'package:hack_puzzle/features/puzzle/data/repositories/puzzle_reposetory_impl.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';
import 'package:hack_puzzle/features/puzzle/domain/usecases/get_all_puzzles.dart';
import 'package:hack_puzzle/features/puzzle/domain/usecases/update_puzzle.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/cubit/all_puzzles_cubit.dart';
import 'package:hack_puzzle/presentation/screens/game/cubit/game_cubit.dart';

class AppBlocs extends StatelessWidget {
  Widget child;
  AppBlocs({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => AllPuzzlesCubit(
                getAllPuzzles: GetAllPuzzles(
                    repository: PuzzleReposetoryImpl(
                        localDataSource: PuzzleDatabseSource())))),
        BlocProvider(
            create: (_) => GameCubit(
                updatePuzzle: UpdatePuzzle(
                    repository: PuzzleReposetoryImpl(
                        localDataSource: PuzzleDatabseSource())))),
      ],
      child: child,
    );
  }
}
