class AuthRepositoryContent {
  static const String authRepositoryContent = '''import 'dart:io';
import 'dart:developer';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
//import 'package:flutter_appauth/flutter_appauth.dart';
import '../view/screens/auth_screen.dart';
import '/data/network/base_api_services.dart';
import '/data/network/network_api_service.dart';
import '/resources/keyclock_vars.dart';
import '/utils/share_preference.dart';
import '/utils/share_singleton.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  // Future<bool> loginApi() async {
  //   // bool _isLoginSuccess = false;
  //   try {
  //     var clientId = KeyClockConstants.clientId;
  //     var scopes = List<String>.of(['openid', 'profile']);
  //     String authUrl =
  //         '\${KeyClockUrl.authServerUrl}realms/\${KeyClockConstants.database}\${KeyClockUrl.login}';
  //     String tokenUrl =
  //         '\${KeyClockUrl.authServerUrl}realms/\${KeyClockConstants.database}\${KeyClockUrl.token}';
  //     FlutterAppAuth appAuth = const FlutterAppAuth();
  //     final AuthorizationTokenResponse? result =
  //         await appAuth.authorizeAndExchangeCode(AuthorizationTokenRequest(
  //       clientId,
  //       KeyClockUrl.redirectUrl,
  //       serviceConfiguration: AuthorizationServiceConfiguration(
  //           authorizationEndpoint: authUrl, tokenEndpoint: tokenUrl),
  //       scopes: scopes,
  //       preferEphemeralSession: true,
  //     ));
  //     if (result != null) {
  //       log("ACCESS TOCKEN \${result.accessToken}");
  //       log("REFRESH TOCKEN \${result.refreshToken}");
  //       log("EXPIRY DATE TIME \${result.accessTokenExpirationDateTime}");
  //       SharedSingleton.shared.accessToken = result.accessToken!;
  //       await SharedPrefCommon.setAccessToken(result.accessToken!);
  //       await SharedPrefCommon.setRefreshToken(result.refreshToken!);
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } on PlatformException catch (e) {
  //     // _isLoginSuccess = false;
  //     throw e;
  //   } catch (e) {
  //     //_isLoginSuccess = false;
  //     throw e;
  //   }
  // }

  Future<bool> authenticateWithKeycloak(BuildContext context) async {
    try {
      Map<String, String>? tokenResponse = await Navigator.push(
        context,
        PageRouteBuilder(
          opaque: false,
          pageBuilder: (context, animation1, animation2) =>
              const KeyklockAuthScreen(
            authServerUrl: KeyClockUrl.authServerUrl,
            realm: KeyClockConstants.database,
            clientId: KeyClockConstants.clientId,
          ),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );

      if (tokenResponse != null) {
        String? accessToken = tokenResponse["access_token"];
        String? refreshToken = tokenResponse["refresh_token"];

        log("ACCESS TOCKEN \$accessToken");
        log("REFRESH TOCKEN \$refreshToken");
        //log("EXPIRY DATE TIME \${result.accessTokenExpirationDateTime}");
        SharedPrefCommon.clearAllPreferences();
        SharedSingleton.shared.accessToken = accessToken!;
        await SharedPrefCommon.setAccessToken(accessToken);
        await SharedPrefCommon.setRefreshToken(refreshToken!);
        return true;
      } else {
        return false;
      }
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw e;
    }
  }

  Future<void> logoutApi(String accessToken, String refreshToken) async {
    try {
      final url =
          "\${KeyClockUrl.authServerUrl}realms/\${KeyClockConstants.database}\${KeyClockUrl.logout}";
      var data = {
        "client_id": KeyClockConstants.clientId,
        "refresh_token": refreshToken
      };
      var headers = {
        "Content-Type": "application/x-www-form-urlencoded",
        HttpHeaders.authorizationHeader: "Bearer \$accessToken",
      };
      var encoding = Encoding.getByName('utf-8');
      dynamic response = await _apiServices.getCustomPostApiResponse(
        url: url,
        data: data,
        header: headers,
        encoding: encoding,
      );
      return response;
    } catch (e) {
      throw e;
    }
  }
}''';
}
