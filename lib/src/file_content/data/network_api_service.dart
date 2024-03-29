class NetworkApiServiceContent {
  static const String networkApiServiceContent = '''import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '/resources/app_urls.dart';
import '../app_exceptions.dart';
import '/data/network/base_api_services.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future<dynamic> getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(AppUrl.baseUrl + url))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> getPostApiResponse(String url, dynamic body) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(AppUrl.baseUrl + url), body: body)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> getPutApiResponse(String url, dynamic body) async {
    dynamic responseJson;
    try {
      final response = await http
          .put(Uri.parse(AppUrl.baseUrl + url), body: body)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> getPatchApiResponse(String url, dynamic body) async {
    dynamic responseJson;
    try {
      final response = await http
          .patch(Uri.parse(AppUrl.baseUrl + url), body: body)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> getDeleteApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .delete(
            Uri.parse(AppUrl.baseUrl + url),
          )
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future<dynamic> getCustomPostApiResponse({
    required String url,
    required dynamic data,
    dynamic header,
    dynamic encoding,
  }) async {
    dynamic responseJson;
    try {
      http.Response response = await http
          .post(
            Uri.parse(url),
            body: data,
            headers: header,
            encoding: encoding,
          )
          .timeout(const Duration(seconds: 10));
      responseJson = response.body.toString();
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occured while communicating with server with status code \${response.statusCode}');
    }
  }
}''';
}
