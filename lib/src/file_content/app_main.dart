class AppMainContent {
  static const String appMainContent =
      '''import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/view/screens/auth_navigator_screen.dart';
import '/resources/app_theme.dart';
import '/view/screens/home_screen.dart';
import '/view/screens/splash_screen.dart';
import '/view_model/auth_view_model.dart';
import '/view_model/language_view_model.dart';
import '/view_model/theme_view_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthViewModel(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ThemeViewModel(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => LanguageViewModel(),
        ),
      ],
      child: Consumer<AuthViewModel>(builder: (context, auth, _) {
        final themeProvider = Provider.of<ThemeViewModel>(context);
        // final languageProvider =
        //     Provider.of<LanguageViewModel>(context, listen: true);
        return MaterialApp(
          title: 'My Application',
          debugShowCheckedModeBanner: false,
          supportedLocales: const [
            Locale('en', 'US'), // English, no country code
            Locale('hi', 'IN'), // Hindi,no country code
          ],
          themeMode: themeProvider.themeMode,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          home: auth.isAuth
              ? const HomeScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (ctx, authResultSnapshot) {
                    return authResultSnapshot.connectionState ==
                            ConnectionState.waiting
                        ? const SplashScreen()
                        : const AuthNavigatiorScreen();
                  }),
        );
      }),
    );
  }
}''';
}
