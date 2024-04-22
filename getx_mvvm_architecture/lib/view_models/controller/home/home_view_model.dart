import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/data/response/status.dart';
import 'package:getx_mvvm_architecture/model/home/user_list_model.dart';
import 'package:getx_mvvm_architecture/repository/home_repository/home_repository.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.LOADING.obs;
  final userList = UserListModel().obs;
  RxString error = "".obs;

  void setRxRequestStatus({required Status value}) =>
      rxRequestStatus.value = value;
  void setUserList({required UserListModel value}) => userList.value = value;
  void setError({required String value}) => error.value = value;

  void userListApi() async {
    setRxRequestStatus(value: Status.LOADING);
    await _api.userListApi().then((value) {
      setRxRequestStatus(value: Status.COMPLETED);
      setUserList(value: value);
    }).onError(
      (error, stackTrace) {
        setRxRequestStatus(value: Status.ERROR);
        setError(value: error.toString());
      },
    );
  }
}
