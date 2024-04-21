import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/res/routes/routes_name.dart';

class SplashServices {
  void isLogin() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offAndToNamed(RouteName.loginView);
      },
    );
  }
}
