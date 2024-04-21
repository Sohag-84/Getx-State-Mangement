import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/model/login/user_model.dart';
import 'package:getx_mvvm_architecture/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm_architecture/res/routes/routes_name.dart';
import 'package:getx_mvvm_architecture/uitls/utils.dart';
import 'package:getx_mvvm_architecture/view_models/controller/user_preferences/user_preferences_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  final _userPreferences = UserPreferences();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool isLoading = false.obs;

  void loginApi() {
    isLoading.value = true;
    Map<String, dynamic> data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    _api.loginApi(data: data).then((value) {
      isLoading.value = false;
      if (value['error'] == "user not found") {
        Utils.showToast(msg: value['error']);
      } else {
        _userPreferences
            .saveUser(responseModel: UserModel.fromJson(value))
            .then((value) {
          Get.offAllNamed(RouteName.homeView);
        }).onError((error, stackTrace) {
          Utils.showToast(msg: error.toString());
        });
        Utils.showToast(msg: "Login Succesful");
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      log("Error: $error ====");
      Utils.snackBar(title: "Error", message: error.toString());
    });
  }
}
