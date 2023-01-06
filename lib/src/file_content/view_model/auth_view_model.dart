class AuthViewModelContent {
  static const String authViewModelContent =
      '''import 'package:flutter/material.dart';
import '/repository/auth_repository.dart';
import '/utils/share_preference.dart';
import '/utils/share_singleton.dart';
import '/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _authRepo = AuthRepository();

  String? _token;

  bool _isLogoutLoading = false;

  bool get isLogoutLoading => _isLogoutLoading;

  setLogoutLoading(bool value) {
    _isLogoutLoading = value;
    notifyListeners();
  }

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  Future<void> loginApi(BuildContext context) async {
    _authRepo.loginApi().then((isLoginSuccess) {
      if (isLoginSuccess) {
        _token = SharedSingleton.shared.accessToken;
        notifyListeners();
      }
    }).onError((error, stackTrace) {
      Utils.showErrorMessageFlushBar(error.toString(), context);
    });
  }

  Future<bool> tryAutoLogin() async {
    final token = await SharedPrefCommon.getAccessToken();
    if (token == null) {
      return false;
    }
    _token = token;
    notifyListeners();
    return true;
  }

  Future<void> logout(BuildContext context) async {
    setLogoutLoading(true);
    var refreshToken = await SharedPrefCommon.getRefreshToken();
    print("REFERSH TOKEN \$refreshToken");

    await _authRepo.logoutApi(_token ?? "", refreshToken).then((value) async {
      _token = null;
      await SharedPrefCommon.clearAllPreferences();
      setLogoutLoading(false);
    }, onError: (error, stackTrace) {
      setLogoutLoading(false);
      Utils.showErrorMessageFlushBar(error.toString(), context);
    });
  }
}
''';
}
