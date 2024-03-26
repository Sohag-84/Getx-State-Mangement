import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/res/routes/routes_name.dart';
import 'package:getx_mvvm_architecture/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashScreen(),
          transitionDuration: const Duration(microseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
