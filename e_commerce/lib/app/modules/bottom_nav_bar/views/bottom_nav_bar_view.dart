// ignore_for_file: unrelated_type_equality_checks

import 'package:e_commerce/constant/app_colors.dart';
import 'package:e_commerce/constant/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarView extends GetView<BottomNavBarController> {
  const BottomNavBarView({Key? key}) : super(key: key);

  final pageList = const [
    Center(
      child: Text("Home"),
    ),
    Center(
      child: Text("Category"),
    ),
    Center(
      child: Text("Search"),
    ),
    Center(
      child: Text("Menu"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavBarView'),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        elevation: 2.0,
        foregroundColor: Colors.white,
        backgroundColor: AppColors.pirmaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: const Icon(Icons.camera, size: 25),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: navbarIcon(
                  onTap: () {
                    controller.onItemTapped(index: 0);
                  },
                  label: home,
                  color: controller.currentIndex == 0
                      ? AppColors.pirmaryColor
                      : AppColors.greyColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: navbarIcon(
                  onTap: () {
                    controller.onItemTapped(index: 1);
                  },
                  label: home,
                  color: controller.currentIndex == 1
                      ? AppColors.pirmaryColor
                      : AppColors.greyColor,
                ),
              ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 1,
                child: navbarIcon(
                  onTap: () {
                    controller.onItemTapped(index: 2);
                  },
                  label: home,
                  color: controller.currentIndex == 2
                      ? AppColors.pirmaryColor
                      : AppColors.greyColor,
                ),
              ),
              Expanded(
                flex: 1,
                child: navbarIcon(
                  onTap: () {
                    controller.onItemTapped(index: 3);
                  },
                  label: home,
                  color: controller.currentIndex == 3
                      ? AppColors.pirmaryColor
                      : AppColors.greyColor,
                ),
              ),
            ],
          );
        }),
      ),
      body: Obx(() {
        return pageList[controller.currentIndex.value];
      }),
    );
  }

  InkWell navbarIcon({
    required VoidCallback onTap,
    required String label,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            Icons.person,
            size: 25,
            color: color,
          ),
          Text(
            label,
            style: TextStyle(
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
