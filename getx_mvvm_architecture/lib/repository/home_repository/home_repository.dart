import 'package:getx_mvvm_architecture/data/network/network_api_services.dart';
import 'package:getx_mvvm_architecture/model/home/user_list_model.dart';
import 'package:getx_mvvm_architecture/res/app_url/app_url.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiServices.getApi(url: AppUrl.userList);
    return UserListModel.fromJson(response);
  }
}
