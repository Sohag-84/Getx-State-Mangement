import 'package:flutter/material.dart';
import 'package:getx_mvvm_architecture/res/routes/colors/app_colors.dart';

class InternetExceptionWidget extends StatefulWidget {
  final VoidCallback onTap;
  const InternetExceptionWidget({super.key, required this.onTap});

  @override
  State<InternetExceptionWidget> createState() =>
      _InternetExceptionWidgetState();
}

class _InternetExceptionWidgetState extends State<InternetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: height * 0.15),
          const Icon(Icons.cloud_off, color: AppColors.redColor, size: 50),
          const Padding(
            padding: EdgeInsets.only(top: 30.0),
            child: Center(
              child: Text(
                "We'r unable to show data \nPlease check your internet connection",
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: height * 0.15),
          InkWell(
            onTap: widget.onTap,
            child: Container(
              height: 42,
              width: 170,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(50),
              ),
              child: const Text(
                "Retry",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
