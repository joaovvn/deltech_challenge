extension StringExtensions on String {
  String get capitalizeFirst {
    if (isEmpty) return this; // Retorna a string original se estiver vazia
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String get capitalizeWords {
    return split(' ').map((word) => word.capitalizeFirst).join(' ');
  }
}
