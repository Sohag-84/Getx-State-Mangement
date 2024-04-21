import 'package:getx_mvvm_architecture/data/network/network_api_services.dart';
import 'package:getx_mvvm_architecture/res/app_url/app_url.dart';

class LoginRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> loginApi({required var data}) async {
    dynamic response = await _apiServices.postApi(
      data: data,
      url: AppUrl.loginUrl,
    );
    return response;
  }
}
