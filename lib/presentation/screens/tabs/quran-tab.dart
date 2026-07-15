import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:islamiapp/core/constants/app_text_style.dart';
import 'package:islamiapp/presentation/widgets/most_recently.dart';
import 'package:islamiapp/presentation/widgets/quran_text_field.dart';
import 'package:islamiapp/presentation/widgets/sura_list.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children: [
            Center(child: Image.asset(AppAssets.islamiOnBoarding)),
            QuranTextField(),
            Text("Most Recently", style: AppTextStyle.bold16White),
            MostRecently(suras: List.generate(4, (i) => i)),
            Text("Suras List", style: AppTextStyle.bold16White),
            SizedBox(
              height: 200.h,
              child: Expanded(child: SuraList()),
            ),
          ],
        ),
      ),
    );
  }
}
