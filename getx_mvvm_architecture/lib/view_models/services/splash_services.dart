import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/res/routes/routes_name.dart';

import '../controller/user_preferences/user_preferences_view_model.dart';

class SplashServices {
  void isLogin() {
    UserPreferences userPreferences = UserPreferences();

    userPreferences.getUser().then((value) {
      if (value.token!.isEmpty || value.token.toString() == 'null') {
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Get.offAndToNamed(RouteName.loginView);
          },
        );
      } else {
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Get.offAndToNamed(RouteName.homeView);
          },
        );
      }
    });
  }
}
