class KeyclockVarsContent {
  static const String keyclockVarsContent = '''class KeyClockConstants {
  static const database = "63b1c88f4466e083992b2a59";
  static const clientId = "masterClient";

  // static const DATABASE = "TestRealm";
  // static const CLIENT_ID = "testClient";

}

class KeyClockUrl {
  //need to change as per project
  // static const authServerUrl = "http://0.0.0.0:8080/";
  // static const redirectUrl = "gessa.io:/oauth2redirect";
  static const authServerUrl = "https://auth-dev.gessa.io/";
  static const redirectUrl = "gessa.io:/oauth2redirect";
  //remains same for every project
  static var login = "/protocol/openid-connect/auth";
  static var logout = "/protocol/openid-connect/logout";
  static var token = "/protocol/openid-connect/token";
}''';
}
