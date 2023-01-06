class UserRepositoryContent {
  static const String userRepositoryContent =
      '''import '/data/network/base_api_services.dart';
import '/data/network/network_api_service.dart';
import '/model/users_model.dart';
import '/resources/app_urls.dart';

class UserRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<UserModel> getUserApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.users);
      final returnResponse = UserModel.fromJson(response);
      return returnResponse;
    } catch (e) {
      throw e;
    }
  }
}''';
}
