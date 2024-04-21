import 'package:getx_mvvm_architecture/model/login/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  Future<bool> saveUser({required UserModel responseModel}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("token", responseModel.token.toString());
    return true;
  }

  Future<UserModel> getUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? token = preferences.getString("token");
    return UserModel(token: token);
  }

  Future<bool> removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
    return true;
  }
}
