import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      final String path = join(await getDatabasesPath(), "hack_puzzle.db");
      _database = await openDatabase(path, version: 1);
      return _database!;
    }
  }
}
