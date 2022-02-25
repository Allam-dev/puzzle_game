import 'package:hack_puzzle/features/puzzle/data/data_sources/local/puzzle_database_source.dart';
import 'package:hack_puzzle/features/puzzle/data/data_sources/local/puzzle_local_data_source.dart';
import 'package:hack_puzzle/features/puzzle/data/repositories/puzzle_reposetory_impl.dart';
import 'package:hack_puzzle/features/puzzle/domain/usecases/get_all_puzzles.dart';
import 'package:hack_puzzle/features/puzzle/domain/usecases/update_puzzle.dart';
import 'package:hack_puzzle/injection.dart';

import 'domain/repositories/puzzle_repository.dart';

void puzzleInjectionSetup() {
  // use cases
  getIt.registerFactory(
      () => GetAllPuzzles(repository: getIt<PuzzleRepository>()));
  getIt.registerFactory(
      () => UpdatePuzzle(repository: getIt<PuzzleRepository>()));

  // reposetories
  getIt.registerLazySingleton<PuzzleRepository>(() =>
      PuzzleReposetoryImpl(localDataSource: getIt<PuzzleLocalDataSource>()));

  // data sources
  getIt.registerLazySingleton<PuzzleLocalDataSource>(
      () => PuzzleDatabseSource());
}
