extension StringExtension on String {
  static String capitalize(s) {
    return "${s[0].toUpperCase()}${s.substring(1).toLowerCase()}";
  }
}
