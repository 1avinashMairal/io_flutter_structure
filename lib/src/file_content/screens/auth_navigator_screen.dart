class AuthNavigatorScreenContent {
  static const String authNavigatorScreenContent =
      '''import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/view_model/auth_view_model.dart';

class AuthNavigatiorScreen extends StatefulWidget {
  const AuthNavigatiorScreen({super.key});

  @override
  State<AuthNavigatiorScreen> createState() => _AuthNavigatiorScreenState();
}

class _AuthNavigatiorScreenState extends State<AuthNavigatiorScreen> {
  bool isLoading = true;
  @override
  void initState() {
    login();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> login() async {
    Future.delayed(Duration.zero, () async {
      Provider.of<AuthViewModel>(context, listen: false).loginApi(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Redirecting to authentication please wait...")
          ],
        ),
      ),
    );
  }
}
''';
}
