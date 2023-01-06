class ChangeLanguageScreenContent {
  static const String changeLanguageScreenContent =
      '''import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '/view/widgets/change_language_radio_button.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<ChangeLanguageScreen> createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.change_language),
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
}
''';
}
