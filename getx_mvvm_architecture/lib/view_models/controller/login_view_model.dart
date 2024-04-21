import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm_architecture/uitls/utils.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

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
        Utils.showToast(msg: "Login Succesful");
      }
    }).onError((error, stackTrace) {
      isLoading.value = false;
      log("Error: $error ====");
      Utils.snackBar(title: "Error", message: error.toString());
    });
  }
}
