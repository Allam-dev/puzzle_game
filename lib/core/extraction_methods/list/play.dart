import 'dart:math';

extension Play on List<int> {
  void play({required int index, required Function afterPlay}) {
    int rows = sqrt(length).toInt();
    if (indexOf(0) > index) {
      int result = indexOf(0) - index;
      // vertical
      if (result % rows == 0) {
        while (indexOf(0) != index) {
          int decrementer = indexOf(0) - rows;
          this[indexOf(0)] = this[decrementer];
          this[decrementer] = 0;
        }
        afterPlay();
      }
      // horizontal
      else if (indexOf(0) ~/ rows == index ~/ rows) {
        while (indexOf(0) != index) {
          int decrementer = indexOf(0) - 1;
          this[indexOf(0)] = this[decrementer];
          this[decrementer] = 0;
        }
        afterPlay();
      }
    } else if (index > indexOf(0)) {
      int result = index - indexOf(0);
      // vertical
      if (result % rows == 0) {
        while (indexOf(0) != index) {
          int incrementer = indexOf(0) + rows;
          this[indexOf(0)] = this[incrementer];
          this[incrementer] = 0;
        }
        afterPlay();
      }
      // horizontal
      else if (indexOf(0) ~/ rows == index ~/ rows) {
        while (indexOf(0) != index) {
          int incrementer = indexOf(0) + 1;
          this[indexOf(0)] = this[incrementer];
          this[incrementer] = 0;
        }
        afterPlay();
      }
    }
  }
}
