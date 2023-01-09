class ChangeLangRadioBtnContent {
  static const String changeLangRadioBtnContent =
      '''import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/app_language.dart';
import '/view_model/language_view_model.dart';

class ChangeLanguageRadioButtonWidget extends StatelessWidget {
  const ChangeLanguageRadioButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageViewModel>(context);
    return Column(
      children: [
        RadioListTile<AppLanguage>(
          title: Text(languageProvider.appStrings.english),
          value: AppLanguage.ENGLISH,
          groupValue: languageProvider.selectedLanguage,
          onChanged: languageProvider.setLocale,
        ),
        RadioListTile<AppLanguage>(
          title: Text(languageProvider.appStrings.marathi),
          value: AppLanguage.MARATHI,
          groupValue: languageProvider.selectedLanguage,
          onChanged: languageProvider.setLocale,
        ),
      ],
    );
  }
}''';
}
