extension Tool on String {
  String get padZero {
    return length > 1 ? this : '0$this';
  }
}