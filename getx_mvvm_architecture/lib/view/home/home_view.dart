import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/res/routes/routes_name.dart';
import 'package:getx_mvvm_architecture/view_models/controller/user_preferences/user_preferences_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _userPreferences = UserPreferences();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home View"),
        actions: [
          IconButton(
            onPressed: () {
              _userPreferences.removeUser().then((value) {
                Get.offAllNamed(RouteName.loginView);
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
