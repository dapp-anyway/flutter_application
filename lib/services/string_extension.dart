extension StringExtension on String {
  static String capitalize(s) {
    try {
      return "${s[0].toUpperCase()}${s.substring(1).toLowerCase()}";
    } catch (error) {
      return "";
    }
  }
}
