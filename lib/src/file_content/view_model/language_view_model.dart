class LanguageViewModelContent {
  static const String languageViewModelContent =
      '''import 'package:flutter/material.dart';
import '../resources/language_strings.dart';
import '../resources/primary_lang_strings.dart';
import '../resources/secondary_lang_strings.dart';
import '../resources/app_language.dart';

class LanguageViewModel with ChangeNotifier {
  AppLanguage _selectedLanguage = AppLanguage.ENGLISH;

  AppStrings _appStrings = PrimaryAbstractStrings();

  bool get isPrimaryLanguage => _selectedLanguage == AppLanguage.ENGLISH;

  AppLanguage get selectedLanguage => _selectedLanguage;

  AppStrings get appStrings => _appStrings;

  void toggleLanguage(BuildContext context, bool isOn) {
    if (isOn) {
      _appStrings = PrimaryAbstractStrings();
    } else {
      _appStrings = SecondaryAbstractStrings();
    }

    notifyListeners();
  }

  void setLocale(language) {
    if (language == AppLanguage.ENGLISH) {
      _appStrings = PrimaryAbstractStrings();
    } else {
      _appStrings = SecondaryAbstractStrings();
    }
    _selectedLanguage = language;
    notifyListeners();
  }
}''';
}
