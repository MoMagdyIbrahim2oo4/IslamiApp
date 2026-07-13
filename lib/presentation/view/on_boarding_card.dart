import 'package:flutter/material.dart';
import 'package:islamiapp/core/constants/AppColors.dart';
import 'package:sizer/sizer.dart';

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
          Image.asset(image),
          SizedBox(height: 2.15.h),
          Text(
            title ?? "",
            style: TextStyle(
              color: Appcolors.gold,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.18.h),
          Text(
            description,
            style: TextStyle(
              color: Appcolors.gold,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 19.77.h),
          Text(
            description,
            style: TextStyle(
              color: Appcolors.gold,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
