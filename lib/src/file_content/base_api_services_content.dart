class BaseApiServiceContent {
  static const String baseApiServiceContent =
      '''abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);
  Future<dynamic> getPostApiResponse(String url, dynamic data);
  Future<dynamic> getCustomPostApiResponse(
      {required String url,
      required dynamic data,
      dynamic header,
      dynamic encoding});
}''';
}
