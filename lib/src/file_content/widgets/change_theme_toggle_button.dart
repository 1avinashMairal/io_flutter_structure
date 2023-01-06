class ChangeThemeToggleBtnContent {
  static const String changeThemeToggleBtnContent =
      '''import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/view_model/theme_view_model.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeViewModel>(context);
    return Switch.adaptive(
        value: themeProvider.isDarkMode,
        onChanged: (value) {
          final provider = Provider.of<ThemeViewModel>(context, listen: false);
          provider.toggleTheme(value);
        });
  }
}''';
}
