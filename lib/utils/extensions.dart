extension StringExtensions on String {
  String splitTextByCapitalLetter() {
    return replaceAllMapped(
        RegExp(r'([A-Z])'), (Match match) => ' ${match.group(0)}').trim();
  }
}
