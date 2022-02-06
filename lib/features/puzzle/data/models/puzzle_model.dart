import 'package:hack_puzzle/features/puzzle/domain/entities/puzzle.dart';

class PuzzleModel extends Puzzle {
  PuzzleModel(
      {required int id,
      required int rows,
      required int columns,
      int steps = 0,
      int timeBySec = 0,
      bool isOpen = false})
      : super(
            id: id,
            rows: rows,
            columns: columns,
            isOpen: isOpen,
            steps: steps,
            timeBySec: timeBySec);

  factory PuzzleModel.fromJson(Map<String, dynamic> data) {
    return PuzzleModel(
      isOpen: data["is_open"] == 1 ? true : false,
      columns: data["columns"],
      id: data["id"],
      rows: data["rows"],
      steps: data["steps"],
      timeBySec: data["time_by_sec"],
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
