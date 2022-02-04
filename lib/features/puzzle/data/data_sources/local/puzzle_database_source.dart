import 'package:hack_puzzle/core/error/exceptions.dart';
import 'package:hack_puzzle/core/helpers/database/database_helper.dart';
import 'package:hack_puzzle/features/puzzle/data/data_sources/local/puzzle_local_data_source.dart';
import 'package:hack_puzzle/features/puzzle/data/models/puzzle_model.dart';
import 'package:sqflite/sqflite.dart';

class PuzzleDatabseSource implements PuzzleLocalDataSource {
  final String _tableName = "hack_puzzles";

  @override
  Future<bool> isPuzzlesTabelExisting() async {
    Database database = await DatabaseHelper.database;
    try {
      await database.query(_tableName);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> createPuzzleTable() async {
    Database database = await DatabaseHelper.database;
    int firstLevel = 2;
    int lastLevel = 16;
    try {
      await database.execute(
          "CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, rows INTEGER, columns INTEGER, steps INTEGER, time_by_sec INTEGER, size INTEGER, is_open INTEGER)");
      for (int i = firstLevel; i <= lastLevel; i++) {
        PuzzleModel puzzle;
        if (i == firstLevel) {
          puzzle = PuzzleModel(id: 0, rows: i, columns: i, isOpen: true);
        } else {
          puzzle = PuzzleModel(id: 0, rows: i, columns: i);
        }
        await database.insert(_tableName, puzzle.toJson);
      }
    } on DatabaseException {
      throw CreateTableException();
    }
  }

  @override
  Future<List<PuzzleModel>> getAllPuzzles() async {
    Database database = await DatabaseHelper.database;
    List<PuzzleModel> puzzles = [];
    try {
      List<Map<String, Object?>> query = await database.query(_tableName);
      for (var element in query) {
        puzzles.add(PuzzleModel.fromJson(element));
      }
      return puzzles;
    } on DatabaseException {
      throw QueryException();
    }
  }

  @override
  Future<void> updatePuzzle(
      {required Map<String, Object?> values, required int id}) async {
    Database database = await DatabaseHelper.database;
    try {
      await database
          .update(_tableName, values, where: "id = ?", whereArgs: [id]);
    } on DatabaseException {
      throw UpdateTableException();
    }
  }
}
