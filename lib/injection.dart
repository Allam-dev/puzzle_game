import 'package:get_it/get_it.dart';
import 'package:hack_puzzle/features/puzzle/puzzle_injection.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/cubit/all_levels_cubit.dart';
import 'features/puzzle/domain/usecases/get_all_puzzles.dart';

final getIt = GetIt.instance;

void injectionSetUp(){
  // bloc and cubits
  getIt.registerLazySingleton(() => AllLevelsCubit(getAllLevels: getIt<GetAllPuzzles>()));

  // features
  puzzleInjectionSetup();
}
