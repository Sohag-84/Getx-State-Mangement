import 'package:e_commerce/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';
import '../widgets/cart_item.dart';
import '../widgets/checkout_container.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Shopping Cart (4)',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: checkoutContainer(
        subtotal: "123",
        onTap: () {},
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Text(
              "Added Items (4 items)",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 3.h),

            ///cart item
            cartItem(
              incrementTap: () {},
              decrementTap: () {},
              deleteTap: () {},
              proImage: "assets/images/carrot.png",
              proName: "Tropical Fruit Trio(Rambutan)",
              cartItemCount: 12,
              proPrice: "234",
            ),
          ],
        ),
      ),
    );
  }
}
