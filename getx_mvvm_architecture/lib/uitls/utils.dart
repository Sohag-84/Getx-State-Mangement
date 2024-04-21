import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/res/routes/colors/app_colors.dart';

class Utils {
  ///to change textfield keyboard [focus]
  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  ///for show [toast] message
  static showToast({required String msg}) {
    return Fluttertoast.showToast(
      msg: msg,
      backgroundColor: AppColors.blackColor,
    );
  }

  ///for [snackbar]
  static snackBar({required String title, required String message}) {
    return Get.snackbar(title, message);
  }
}
