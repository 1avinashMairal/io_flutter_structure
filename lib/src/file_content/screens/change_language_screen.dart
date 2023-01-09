class ChangeLanguageScreenContent {
  static const String changeLanguageScreenContent =
      '''import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/view_model/language_view_model.dart';
import '/view/widgets/change_language_radio_button.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = context.watch<LanguageViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(languageProvider.appStrings.changeLanguage),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            ChangeLanguageRadioButtonWidget(),
          ],
        ),
      ),
    );
  }
}''';
}
