class SharePreferenceContent {
  static const String sharePreferenceContent =
      '''import '/utils/share_singleton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefCommon {
  static String REFERESH_TOKEN = "refreshtoken";
  static String USER_NAME = "username";
  static String USER_EMAIL = "useremail";
  static const String ACCESS_TOKEN = "ACCESS_TOKEN";

  static Future<void> clearAllPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(REFERESH_TOKEN);
    prefs.remove(USER_NAME);
    prefs.remove(USER_EMAIL); // important! Don't forget!
    prefs.remove(ACCESS_TOKEN);
    SharedSingleton.shared.accessToken = "";
  }

  static setAccessToken(String accessTocken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(ACCESS_TOKEN, accessTocken);
    return true;
  }

  static getAccessToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(ACCESS_TOKEN);
  }

  static setRefreshToken(String refreshTocken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(REFERESH_TOKEN, refreshTocken);
    return true;
  }

  static getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(REFERESH_TOKEN);
  }

  static setUserName(String userName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_NAME, userName);
    return true;
  }

  static getUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER_NAME);
  }

  static setUserEmail(String userEmail) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(USER_EMAIL, userEmail);
    return true;
  }

  static getEmailId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(USER_EMAIL);
  }
}
''';
}
