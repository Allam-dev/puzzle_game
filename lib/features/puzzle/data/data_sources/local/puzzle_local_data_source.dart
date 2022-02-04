import 'package:dartz/dartz.dart';
import 'package:hack_puzzle/core/error/failures.dart';
import 'package:hack_puzzle/features/puzzle/data/models/puzzle_model.dart';

abstract class PuzzleLocalDataSource {
  Future<bool> isPuzzlesTabelExisting();
  Future<void> createPuzzleTable();
  Future<List<PuzzleModel>> getAllPuzzles();
  Future<void> updatePuzzle(
      {required Map<String, Object?> values, required int id});
}
