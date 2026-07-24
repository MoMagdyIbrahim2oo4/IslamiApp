import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:islamiapp/core/constants/AppColors.dart';
import 'package:islamiapp/core/constants/app_text_style.dart';

class HadethCard extends StatelessWidget {
  String hadethTitle;
  String hadeth;

  HadethCard({super.key, required this.hadethTitle, required this.hadeth});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      decoration: BoxDecoration(
        color: Appcolors.gold,
        borderRadius: BorderRadius.circular(20.r),
        image: DecorationImage(
          image: AssetImage(AppAssets.hadethCardBackground),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                Text(hadethTitle, style: AppTextStyle.bold20Primary),
                SizedBox(height: 50.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      TextSpan(
                        children: [
                          TextSpan(
                            text: hadeth,
                            style: AppTextStyle.bold16Primary,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
