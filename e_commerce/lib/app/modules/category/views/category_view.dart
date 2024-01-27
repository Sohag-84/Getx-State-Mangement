import 'package:e_commerce/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';
import '../widgets/category_action_icon.dart';

import '../widgets/product_container.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          "Fruits & Vegetables",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          actionIconWidget(
            icon: Icons.dark_mode_outlined,
          ),
          SizedBox(width: 10.w),
          actionIconWidget(
            icon: Icons.favorite_border,
          ),
          SizedBox(width: 5.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: GridView.builder(
          itemCount: 5,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.w,
            mainAxisSpacing: 10.h,
            mainAxisExtent: 250.h,
          ),
          itemBuilder: (BuildContext context, int index) {
            return productContainer(
              isButtonClicked: false,
              addToCartTap: (){},
              incrementTap: () {},
              decrementTap: () {},
              cartItem: 1,
              proImage: "assets/images/apple.png",
              proDiscountImage: "assets/images/discount.png",
              proDiscount: "10% off",
              plasticStatus: "Plastic Free",
              proStockStatus: "In stock",
              proName: "Carrot Fruit Fresh",
              proAmount: "2kg",
              proNewPrice: "124",
              proOldPrice: "150",
            );
          },
        ),
      ),
    );
  }
}
