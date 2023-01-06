class HomeScreenContent {
  static const String homeScreenContent =
      '''import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '/view/screens/change_language_screen.dart';
import '/view/screens/change_theme_screen.dart';
import '/view/screens/user_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedScreenIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  static const List<Widget> screenList = <Widget>[
    UsersScreen(),
    ChangeThemeScreen(),
    ChangeLanguageScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList.elementAt(selectedScreenIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: AppLocalizations.of(context)!.home,
            //backgroundColor: Colors.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_to_home_screen_sharp),
            label: AppLocalizations.of(context)!.theme,
            //backgroundColor: Colors.lightGreen,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.language),
            label: AppLocalizations.of(context)!.language,
            //backgroundColor: Colors.lightGreen,
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedScreenIndex,
        selectedItemColor: Colors.black,
        // backgroundColor: Colors.green,
        //iconSize: 40,
        onTap: _onItemTapped,
        //elevation: 5
      ),
    );
  }
}''';
}
