class KeyclockVarsContent {
  static const String keyclockVarsContent = '''class KeyClockConstants {
  static const database = "testDB";
  static const clientId = "masterClient";

}

class KeyClockUrl {
  //need to change as per project
  static const authServerUrl = "http://0.0.0.0:8080/";
  static const redirectUrl = "gessa.io:/oauth2redirect";

  //remains same for every project
  static var login = "/protocol/openid-connect/auth";
  static var logout = "/protocol/openid-connect/logout";
  static var token = "/protocol/openid-connect/token";
}''';
}
