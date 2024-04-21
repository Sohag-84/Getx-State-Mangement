// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:getx_mvvm_architecture/res/routes/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final double height;
  final double width;
  const RoundButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          title,
          style: const TextStyle(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
