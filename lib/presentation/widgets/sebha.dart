import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/core/constants/app_text_style.dart';

import '../../core/constants/AppAssets.dart';
import '../../data/resources/tasabih_resourses.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;
  int index = 0;
  double turns = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return InkWell(
      onTap: onTasbihclick,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Row(),
          Image.asset(AppAssets.sebhaHead, height: height * 0.1),
          Positioned.fill(
            top: height * 0.08,
            child: Stack(
              children: [
                AnimatedRotation(
                    turns: turns, duration: Duration(milliseconds: 200),
                    child: Image.asset(
                        AppAssets.sebhaBody, width: double.infinity)),
                Column(
                  mainAxisAlignment: .center,
                  // crossAxisAlignment: .center,
                  children: [
                    Row(),
                    SizedBox(height: 60.h),
                    Text(
                      TasabihResourses.tasabihList[index],
                      style: AppTextStyle.bold36White,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: 50.h),
                    Text(counter.toString(), style: AppTextStyle.bold36White),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  onTasbihclick() {
    setState(() {
      turns += 0.030;
      if (counter == 32) {
        counter = 0;
        index = (index + 1) % TasabihResourses.tasabihList.length;
        return;
      }
      counter++;
    });
  }
}
