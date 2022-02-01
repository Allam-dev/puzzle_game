import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';

class PuzzleModel extends Puzzle {
  PuzzleModel(
      {required int id,
      required int rows,
      required int columns,
      bool isOpen = false})
      : super(id: id, rows: rows, columns: columns, isOpen: isOpen);

  PuzzleModel.withList(
      {required int id,
      required int rows,
      required int columns,
      bool isOpen = false})
      : super.withList(id: id, rows: rows, columns: columns, isOpen: isOpen);

  factory PuzzleModel.fromJson(Map<String, dynamic> data) {
    return PuzzleModel(
      isOpen: data["is_open"] == 1 ? true : false,
      columns: data["columns"],
      id: data["id"],
      rows: data["rows"],
    );
  }

  factory PuzzleModel.fromJsonWithList(Map<String, dynamic> data) {
    return PuzzleModel.withList(
      isOpen: data["is_open"] == 1 ? true : false,
      columns: data["columns"],
      id: data["id"],
      rows: data["rows"],
    );
  }

  Map<String, dynamic> get toJson => {
        "rows": rows,
        "columns": columns,
        "steps": steps,
        "size": size,
        "time_by_sec": timeBySec,
        "is_open": isOpen == true ? 1 : 0,
      };
}
