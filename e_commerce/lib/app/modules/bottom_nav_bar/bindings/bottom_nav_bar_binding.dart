import 'package:e_commerce/app/modules/category/controllers/category_controller.dart';
import 'package:get/get.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(
      () => BottomNavBarController(),
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
  }
}
