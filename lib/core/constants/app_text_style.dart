import 'package:flutter/material.dart';

import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import 'AppColors.dart';

abstract class AppTextStyle {
  static final TextStyle bold24Gold = TextStyle(
    color: Appcolors.gold,
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
    fontFamily: "Janna LT",
  );

  static final TextStyle bold20Gold = TextStyle(
    color: Appcolors.gold,
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    fontFamily: "Janna LT",
  );

  static final TextStyle bold16Gold = TextStyle(
    color: Appcolors.gold,
    fontWeight: FontWeight.bold,
    fontSize: 16.sp,
  );
}
