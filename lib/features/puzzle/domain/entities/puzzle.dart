class Puzzle {
  late final int id;
  late final int rows;
  late final int columns;
  late int steps;
  late int timeBySec;
  late final int size;
  late bool isOpen;
  List<int> list = [];

  Puzzle(
      {required this.id,
      required this.rows,
      required this.columns,
      this.steps = 0,
      this.timeBySec = 0,
      this.isOpen = false})
      : size = rows * columns;

  void createList() {
    list.clear();
    for (int i = 0; i < size; i++) {
      list.add(i);
    }
    list.shuffle();
  }
}
