import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:islamiapp/core/constants/AppColors.dart';
import 'package:islamiapp/core/constants/app_text_style.dart';
import 'package:islamiapp/core/utils/app_logic.dart';

class MostRecently extends StatelessWidget {
  List<int> suras;

  MostRecently({super.key, required this.suras});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => RecentSura(
          arabicName: AppLogic.suraList[index].arabicQuranSuras,
          englishName: AppLogic.suraList[index].englishQuranSuras,
          verses: AppLogic.suraList[index].AyaNumbers,
        ),
        separatorBuilder: (context, index) => SizedBox(width: 10.w),
        itemCount: suras.length,
      ),
    );
  }
}

class RecentSura extends StatelessWidget {
  String arabicName;
  String englishName;
  String verses;

  RecentSura({
    super.key,
    required this.arabicName,
    required this.englishName,
    required this.verses,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Appcolors.gold,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(arabicName, style: AppTextStyle.bold24Primary),
                Text(englishName, style: AppTextStyle.bold24Primary),
                Text("$verses Verses", style: AppTextStyle.bold14Primary),
              ],
            ),
            SizedBox(width: 5.w),
            Image.asset(AppAssets.mostRecentImage),
          ],
        ),
      ),
    );
  }
}
