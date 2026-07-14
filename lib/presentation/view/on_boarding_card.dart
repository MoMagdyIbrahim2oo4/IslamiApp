import 'package:flutter/material.dart';
import 'package:islamiapp/core/constants/AppColors.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class OnBoardingCard extends StatelessWidget {
  String image;
  String? title;
  String description;

  OnBoardingCard({
    super.key,
    required this.image,
    this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Visibility(
      visible: title == null,
      replacement: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 372.15.w,
            height: 338.8.h,
            child: Image.asset(image),
          ),
          // SizedBox(height: 50.5.h),
          Spacer(flex: 1,),
          Text(
            title ?? "",
            style: TextStyle(
              color: Appcolors.gold,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          // SizedBox(height: 39.75.h),
          Spacer(flex: 3,),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Appcolors.gold,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 372.15.w,
            height: 338.8.h,
            child: Image.asset(image),
          ),
          // SizedBox(height: 85.33.h),
          Spacer(flex: 2,),
          Text(
            description,
            style: TextStyle(
              color: Appcolors.gold,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
