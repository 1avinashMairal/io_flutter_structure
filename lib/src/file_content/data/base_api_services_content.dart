class BaseApiServiceContent {
  static const String baseApiServiceContent =
      '''abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic body);
  Future<dynamic> getPatchApiResponse(String url, dynamic body);
  Future<dynamic> getPutApiResponse(String url, dynamic body);
  Future<dynamic> getDeleteApiResponse(String url);
  Future<dynamic> getCustomPostApiResponse(
      {required String url,
      required dynamic data,
      dynamic header,
      dynamic encoding});
}''';
}
