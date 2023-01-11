class AuthScreenContent {
  static const String authScreenContent = '''import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class KeyklockAuthScreen extends StatefulWidget {
  final String authServerUrl;
  final String clientId;
  final String realm;

  const KeyklockAuthScreen(
      {super.key,
      required this.authServerUrl,
      required this.clientId,
      required this.realm});

  @override
  State<KeyklockAuthScreen> createState() => _KeyklockAuthScreenState();
}

class _KeyklockAuthScreenState extends State<KeyklockAuthScreen> {
  var _isLoading = true;
  late String authUrl;
  @override
  void initState() {
    super.initState();
    authUrl =
        'assets/login.html?authServerUrl=\${widget.authServerUrl}&clientId=\${widget.clientId}&realm=\${widget.realm}';
  }

  Future<bool> _onWillPop() async {
    return false;
  }

  void authenticatedResponse(
      {required String accessToken, required String refreshToken}) {
    var response = {"access_token": accessToken, "refresh_token": refreshToken};
    Navigator.pop(context, response);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              WebViewPlus(
                javascriptChannels: {
                  JavascriptChannel(
                      name: 'MessageToFlutter',
                      onMessageReceived: (JavascriptMessage message) {
                        var data = json.decode(message.message);
                        if (data != null && data is Map) {
                          authenticatedResponse(
                              accessToken: data["token"],
                              refreshToken: data["refreshToken"]);
                        } else {
                          print("error occured : " + data);
                        }
                      })
                },
                initialUrl: authUrl,
                onWebViewCreated: (controller) {
                  controller.webViewController.clearCache();
                  final cookieManager = CookieManager();
                  cookieManager.clearCookies();
                },
                onPageFinished: (url) {
                  setState(() {
                    _isLoading = false;
                  });
                },
                javascriptMode: JavascriptMode.unrestricted,
              ),
              _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(),
            ],
          ),
        ),
      ),
    );
  }
}''';
}
