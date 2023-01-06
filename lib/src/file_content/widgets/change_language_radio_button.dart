class ChangeLangRadioBtnContent {
  static const String changeLangRadioBtnContent =
      '''import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '/resources/language_locale.dart';
import '/view_model/language_view_model.dart';

class ChangeLanguageRadioButtonWidget extends StatelessWidget {
  const ChangeLanguageRadioButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageViewModel>(context);
    return Column(
      children: [
        RadioListTile<Locale>(
          title: Text(AppLocalizations.of(context)!.english),
          value: LanguageLocale.english,
          groupValue: languageProvider.selectedLocale,
          onChanged: languageProvider.setLocale,
        ),
        RadioListTile<Locale>(
          title: Text(AppLocalizations.of(context)!.hindi),
          value: LanguageLocale.hindi,
          groupValue: languageProvider.selectedLocale,
          onChanged: languageProvider.setLocale,
        ),
      ],
    );
  }
}''';
}
