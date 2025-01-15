extension IntegerExtensions on int {
  String get idString {
    if (this > 999) return '#$this';
    if (this < 10) return '#000$this';
    if (this > 10 && this < 100) return '#00$this';
    return '#0$this';
  }

  String get decimeterToMeter {
    return '${this / 10}m';
  }

  String get hectogramToKilogram {
    return '${this / 10}kg';
  }
}
