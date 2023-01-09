class ChangeThemeScreenContent {
  static const String changeThemeScreenContent =
      '''import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/view_model/language_view_model.dart';
import '/view/widgets/change_theme_toggle_button.dart';

class ChangeThemeScreen extends StatefulWidget {
  const ChangeThemeScreen({super.key});

  @override
  State<ChangeThemeScreen> createState() => _ChangeThemeScreenState();
}

class _ChangeThemeScreenState extends State<ChangeThemeScreen> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = context.watch<LanguageViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(languageProvider.appStrings.changeTheme),
        actions: const [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [],
        ),
      ),
    );
  }
}''';
}
