class Puzzle {
  final int id;
  final int rows;
  final int columns;
  int steps;
  int timeBySec;
  final int size;
  bool isOpen;
  List<int> list = [];

  Puzzle(
      {required this.id,
      required this.rows,
      required this.columns,
      this.steps = 0,
      this.timeBySec = 0,
      this.isOpen = false})
      : size = rows * columns ;

  Puzzle.withList(
      {required this.id,
      required this.rows,
      required this.columns,
      this.steps = 0,
      this.timeBySec = 0,
      this.isOpen = false})
      : size = rows * columns {
    for (int i = 0; i < size; i++) {
      list.add(i);
    }
  }
}
