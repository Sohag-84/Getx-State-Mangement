import 'package:e_commerce/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

Widget discountIndicator({
  required String price,
  required double percentage,
}) {
  return Column(
    children: [
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Add items worth ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
            TextSpan(
              text: 'Tk $price ',
              style: TextStyle(
                color: AppColors.pirmaryColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextSpan(
              text: 'for free shopping',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 5.h),
      LinearPercentIndicator(
        lineHeight: 8.h,
        percent: percentage,
        barRadius: Radius.circular(5.r),
        backgroundColor: AppColors.greyColor,
        progressColor: AppColors.pirmaryColor,
      ),
    ],
  );
}
