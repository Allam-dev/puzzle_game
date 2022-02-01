class Puzzle {
  final int id;
  final int rows;
  final int columns;
  int steps = 0;
  int timeBySec = 0;
  final int size;
  bool isOpen;
  List<int> list = [];

  Puzzle(
      {required this.id,
      required this.rows,
      required this.columns,
      this.isOpen = false})
      : size = rows * columns ;

  Puzzle.withList(
      {required this.id,
      required this.rows,
      required this.columns,
      this.isOpen = false})
      : size = rows * columns {
    for (int i = 0; i < size; i++) {
      list.add(i);
    }
  }
}
