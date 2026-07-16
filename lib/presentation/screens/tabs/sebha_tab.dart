import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/core/constants/app_text_style.dart';
import 'package:islamiapp/presentation/widgets/sebha.dart';

import '../../../core/constants/AppAssets.dart';

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16.h,
      children: [
        Center(child: Image.asset(AppAssets.islamiOnBoarding)),
        Center(
          child: Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: AppTextStyle.bold36White,
          ),
        ),
        Sebha(),
      ],
    );
  }
}
