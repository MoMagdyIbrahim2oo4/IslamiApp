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

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTasbihclick,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppAssets.sebha),
          Column(
            children: [
              Text(
                TasabihResourses.tasabihList[index],
                style: AppTextStyle.bold36White,
              ),
              SizedBox(height: 50.h),
              Text(counter.toString(), style: AppTextStyle.bold36White),
            ],
          ),
        ],
      ),
    );
  }

  onTasbihclick() {
    setState(() {
      if (counter == 32) {
        counter = 0;
        index = (index + 1) % TasabihResourses.tasabihList.length;
        return;
      }
      counter++;
    });
  }
}
