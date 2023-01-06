class ThemeViewModelContent {
  static const String themeViewModelContent =
      '''import 'package:flutter/material.dart';

class ThemeViewModel with ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  /// This will change the theme
  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setTheme(selectedTheme) {
    themeMode = selectedTheme;
    notifyListeners();
  }
}
''';
}
