import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/res/components/round_button.dart';
import 'package:getx_mvvm_architecture/uitls/utils.dart';
import 'package:getx_mvvm_architecture/view_models/controller/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: loginVM.emailController,
                focusNode: loginVM.emailFocusNode.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    Utils.snackBar(title: "Error", message: "Enter Email");
                  }
                  return null;
                },
                onFieldSubmitted: (v) {
                  Utils.fieldFocusChange(
                    context,
                    loginVM.emailFocusNode.value,
                    loginVM.passwordFocusNode.value,
                  );
                },
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: loginVM.passwordController,
                focusNode: loginVM.passwordFocusNode.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    Utils.snackBar(title: "Error", message: "Enter password");
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              RoundButton(
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
                title: "Login",
                height: 40,
                width: 250,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
