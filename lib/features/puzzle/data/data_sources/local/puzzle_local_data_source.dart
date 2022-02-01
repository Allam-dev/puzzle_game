import 'package:hack_puzzle/features/puzzle/data/models/puzzle_model.dart';
import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';

abstract class PuzzleLocalDataSource{
  Future<bool> isPuzzlesTabelExisting();
  Future<void> createPuzzleTable();
  Future<List<PuzzleModel>> getAllPuzzles();
  Future<void> updatePuzzle({required Map<String, Object?> values, required int id});
}