import 'package:e_commerce/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart (4)',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
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

  Widget cartItem({
    required VoidCallback incrementTap,
    required VoidCallback decrementTap,
    required VoidCallback deleteTap,
    required String proImage,
    required String proName,
    required int cartItemCount,
    required String proPrice,
  }) {
    return Row(
      children: [
        Image.asset(
          proImage,
          width: 60.w,
          fit: BoxFit.fill,
        ),

        SizedBox(width: 5.w),

        ///product name || item increment & decrement
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                proName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
               SizedBox(height: 5.w),
              Container(
                width: 150.w,
                height: 30.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(
                    color: AppColors.redAccentColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: decrementTap,
                      child: const Icon(CupertinoIcons.minus),
                    ),
                    Text(cartItemCount.toString()),
                    InkWell(
                      onTap: incrementTap,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        ///price || delete button
        Column(
          children: [
            Text(
              proPrice,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: deleteTap,
              icon: Icon(
                Icons.delete,
                color: AppColors.redAccentColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
