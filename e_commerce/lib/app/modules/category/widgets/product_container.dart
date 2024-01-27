import 'package:e_commerce/constant/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

Widget productContainer({
  required bool isButtonClicked,
  required VoidCallback incrementTap,
  required VoidCallback decrementTap,
  required VoidCallback addToCartTap,
  required int cartItem,
  required String proImage,
  required String proDiscountImage,
  required String? proDiscount,
  required String plasticStatus,
  required String? proStockStatus,
  required String proName,
  required String proAmount,
  required String proNewPrice,
  required String proOldPrice,
}) {
  return Container(
    padding: EdgeInsets.all(5.w),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            ///product image
            Container(
              height: 140.h,
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(proImage),
                ),
              ),
              child: proDiscount == null
                  ? const SizedBox()
                  : Container(
                      height: 50.h,
                      width: 90.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            proDiscountImage,
                          ),
                        ),
                      ),
                      child: Transform.rotate(
                        angle: math.pi / 8,
                        child: Text(
                          proDiscount,
                          style: TextStyle(
                            color: AppColors.redAccentColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
            ),

            ///cart
            Align(
              alignment: Alignment.topLeft,
              child: isButtonClicked
                  ? Container(
                      width: 150.w,
                      height: 35.h,
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      decoration: BoxDecoration(
                        color: AppColors.pirmaryColor,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                          color: AppColors.redAccentColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: incrementTap,
                            child: Icon(
                              Icons.add,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          Text(
                            "$cartItem",
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                          InkWell(
                            onTap: decrementTap,
                            child: Icon(
                              CupertinoIcons.minus,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: addToCartTap,
                      child: Container(
                        height: 40.h,
                        width: 40.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.pirmaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: cartItem == 0
                            ? Icon(
                                Icons.add,
                                color: AppColors.whiteColor,
                                size: 30.h,
                              )
                            : Text(
                                "$cartItem",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.whiteColor,
                                ),
                              ),
                      ),
                    ),
            ),
          ],
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: AppColors.tealColor,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              "Plastic Free",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),

        ///product status
        Text(
          proStockStatus ?? "",
          style: TextStyle(
            color: AppColors.pirmaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),

        ///product name
        Text(
          proName,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),

        Text(
          proAmount,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12.sp,
            color: AppColors.greyColor,
          ),
        ),

        ///product price
        Row(
          children: [
            Text(
              "৳ $proNewPrice",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
              ),
            ),
            SizedBox(width: 5.w),
            Text(
              "৳ $proOldPrice",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: AppColors.greyColor,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
