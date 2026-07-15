import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:islamiapp/core/constants/app_text_style.dart';
import 'package:islamiapp/core/utils/app_logic.dart';

class SuraList extends StatelessWidget {
  const SuraList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => InkWell(
        onTap: () {},
        child: Sura(
          suraNumber: AppLogic.suraList[index].numberOfSura,
          english: AppLogic.suraList[index].englishQuranSuras,
          verses: AppLogic.suraList[index].AyaNumbers,
          arabic: AppLogic.suraList[index].arabicQuranSuras,
        ),
      ),
      separatorBuilder: ((context, index) => Divider(
        color: Colors.white,
        thickness: 1,
        height: 10.h,
        indent: 60.w,
        endIndent: 60.w,
      )),
      itemCount: AppLogic.suraList.length,
    );
  }
}

class Sura extends StatelessWidget {
  String suraNumber;
  String english;
  String verses;
  String arabic;

  Sura({
    super.key,
    required this.suraNumber,
    required this.english,
    required this.verses,
    required this.arabic,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AppAssets.suraNumberIcon),
            Text(suraNumber, style: AppTextStyle.bold20White),
          ],
        ),
        SizedBox(width: 20.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(english, style: AppTextStyle.bold20White),
            Text("$verses Verses", style: AppTextStyle.bold14White),
          ],
        ),
        Spacer(),
        // SizedBox(width: 60.w),
        Text(
          arabic,
          style: AppTextStyle.bold20White,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
