import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:islamiapp/core/constants/AppColors.dart';
import 'package:islamiapp/core/constants/app_text_style.dart';

class QuranTextField extends StatelessWidget {
  const QuranTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTextStyle.bold16White,
      decoration: InputDecoration(
        hintText: "Sura Name",
        hintStyle: AppTextStyle.bold16White,
        prefixIcon: Padding(
          padding: EdgeInsets.all(15.r),
          child: SvgPicture.asset(
            AppAssets.quranIcon,
            colorFilter: ColorFilter.mode(Appcolors.gold, BlendMode.srcIn),
          ),
        ),
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(color: Appcolors.gold),
        //   borderRadius: BorderRadius.circular(10.r),
        // ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.gold),
          borderRadius: BorderRadius.circular(10.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.gold),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
