class LanguageViewModelContent {
  static const String languageViewModelContent =
      '''import 'package:flutter/material.dart';
import '/resources/language_locale.dart';

class LanguageViewModel with ChangeNotifier {
  Locale _selectedLocale = LanguageLocale.english;

  bool get isPrimaryLanguage => _selectedLocale == LanguageLocale.english;

  Locale get selectedLocale => _selectedLocale;

  void toggleLanguage(BuildContext context, bool isOn) {
    isOn
        ? _selectedLocale = LanguageLocale.english
        : _selectedLocale = LanguageLocale.hindi;

    notifyListeners();
  }

  void setLocale(locale) {
    _selectedLocale = locale;
    notifyListeners();
  }
}''';
}
