// ignore_for_file: unrelated_type_equality_checks

import 'package:e_commerce/constant/app_colors.dart';
import 'package:e_commerce/constant/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/bottom_nav_bar_controller.dart';
import 'package:badges/badges.dart' as badges;

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
      floatingActionButton: Container(
        height: 70.h,
        width: 70.w,
        decoration: BoxDecoration(
          color: AppColors.pirmaryColor,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            badges.Badge(
              position: badges.BadgePosition.topEnd(top: -10, end: -12),
              badgeContent: Text(
                '3',
                style: TextStyle(
                  color: AppColors.pirmaryColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              badgeStyle: badges.BadgeStyle(
                badgeColor: AppColors.whiteColor,
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                color: AppColors.whiteColor,
                size: 25.h,
              ),
            ),
            Text(
              '৳ 220',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 1,
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //home
              Expanded(
                flex: 1,
                child: navbarIcon(
                  onTap: () {
                    controller.onItemTapped(index: 0);
                  },
                  icon: Icons.home_sharp,
                  label: home,
                  color: controller.currentIndex == 0
                      ? AppColors.pirmaryColor
                      : AppColors.greyColor,
                ),
              ),
              //category
              Expanded(
                flex: 1,
                child: navbarIcon(
                  onTap: () {
                    controller.onItemTapped(index: 1);
                  },
                  icon: Icons.dashboard,
                  label: category,
                  color: controller.currentIndex == 1
                      ? AppColors.pirmaryColor
                      : AppColors.greyColor,
                ),
              ),
              Expanded(flex: 1, child: Container()),
              //search
              Expanded(
                flex: 1,
                child: navbarIcon(
                  onTap: () {
                    controller.onItemTapped(index: 2);
                  },
                  icon: Icons.search,
                  label: search,
                  color: controller.currentIndex == 2
                      ? AppColors.pirmaryColor
                      : AppColors.greyColor,
                ),
              ),
              //menu
              Expanded(
                flex: 1,
                child: navbarIcon(
                  onTap: () {
                    controller.onItemTapped(index: 3);
                  },
                  icon: Icons.menu,
                  label: menu,
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
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
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
