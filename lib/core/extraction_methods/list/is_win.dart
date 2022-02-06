extension IsWin on List<int> {
  bool isWin() {
    for (int i = 0; i < length; i++) {
      if(i != length-1 && this[i] != i+1){
        return false;
      }
    }
    return true;
  }
}
