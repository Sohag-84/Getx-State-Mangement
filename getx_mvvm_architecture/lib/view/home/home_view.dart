import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_architecture/data/response/status.dart';
import 'package:getx_mvvm_architecture/res/components/general_exception_widget.dart';
import 'package:getx_mvvm_architecture/res/components/internet_exception_widget.dart';
import 'package:getx_mvvm_architecture/res/routes/routes_name.dart';
import 'package:getx_mvvm_architecture/view_models/controller/home/home_view_model.dart';
import 'package:getx_mvvm_architecture/view_models/controller/user_preferences/user_preferences_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeViewModel());
  final _userPreferences = UserPreferences();

  @override
  void initState() {
    super.initState();
    homeController.userListApi();
  }

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
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());

          case Status.ERROR:
            if (homeController.error.value == "No Internet ") {
              return InternetExceptionWidget(onTap: () {
                homeController.userListApi();
              });
            } else {
              return GeneralExceptionWidget(onTap: () {});
            }

          case Status.COMPLETED:
            return ListView.builder(
              itemCount: homeController.userList.value.data!.length,
              itemBuilder: (context, index) {
                final data = homeController.userList.value.data![index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(data.avatar.toString()),
                    ),
                    title: Text(data.firstName ?? ""),
                    subtitle: Text(data.email ?? ""),
                  ),
                );
              },
            );
          default:
            return const SizedBox();
        }
      }),
    );
  }
}
