import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hack_puzzle/core/helpers/packages/hive/hive_constants.dart';
import 'package:hack_puzzle/features/puzzle/puzzle_injection.dart';
import 'package:hack_puzzle/presentation/app/cubit/app_cubit.dart';
import 'package:hack_puzzle/presentation/screens/all_puzzles/cubit/all_levels_cubit.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'features/puzzle/domain/usecases/get_all_puzzles.dart';

final getIt = GetIt.instance;
Database? _database;

Future<void> injectionSetUp() async {
  // bloc and cubits
  getIt.registerLazySingleton<AllLevelsCubit>(
      () => AllLevelsCubit(getAllLevels: getIt<GetAllPuzzles>()));
  await _setAppCubit();

  // features
  puzzleInjectionSetup();

  // packages
  if (_database != null) {
    getIt.registerSingleton<Database>(_database!);
  } else {
    final String path = join(await getDatabasesPath(), "hack_puzzle.db");
    _database = await openDatabase(path, version: 1);
    getIt.registerSingleton<Database>(_database!);
  }
}

Future<void> _setAppCubit() async {
  Box box = await Hive.openBox(HiveConstants.appBox);
  String? langCode = await box.get(HiveConstants.languageKey);
  getIt.registerLazySingleton<AppCubit>(
      () => AppCubit(locale: Locale(langCode ?? "en")));
  await box.close();
}
