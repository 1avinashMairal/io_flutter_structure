class UserViewModelContent {
  static const String userViewModelContent =
      '''import 'package:flutter/material.dart';
import '/data/response/api_response.dart';
import '/model/users_model.dart';
import '/repository/user_repository.dart';
import '/utils/utils.dart';

class UserViewModel with ChangeNotifier {
  final _userRepo = UserRepository();

  ApiResponse<UserModel> userList = ApiResponse.loading();

  setUserResponse(ApiResponse<UserModel> response) {
    userList = response;
    notifyListeners();
  }

  Future<void> getUsersApi(BuildContext context) async {
    setUserResponse(ApiResponse.loading());
    _userRepo.getUserApi().then((value) {
      setUserResponse(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setUserResponse(ApiResponse.error(error.toString()));
      Utils.showErrorMessageFlushBar(error.toString(), context);
    });
  }
}
''';
}
