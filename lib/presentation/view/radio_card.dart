import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:islamiapp/core/constants/AppColors.dart';
import 'package:islamiapp/core/constants/app_text_style.dart';

class RadioCard extends StatefulWidget {
  String name;

  RadioCard({super.key, required this.name});

  @override
  State<RadioCard> createState() => _RadioCardState();
}

class _RadioCardState extends State<RadioCard> {
  bool resume = true;

  bool volumeHigh = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 145.h,
      decoration: BoxDecoration(
        color: Appcolors.gold,
        borderRadius: BorderRadiusGeometry.circular(20.r),
        image: DecorationImage(
          image: AssetImage(
            !resume ? AppAssets.radioMaskOn : AppAssets.radioMaskOff,
          ),
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            Text(
              widget.name,
              style: AppTextStyle.bold20Primary,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: .center,
              spacing: 20.w,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      resume = !resume;
                    });
                  },
                  child: SvgPicture.asset(
                    resume ? AppAssets.resumeIcon : AppAssets.pauseIcon,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      volumeHigh = !volumeHigh;
                    });
                  },
                  child: SvgPicture.asset(
                    volumeHigh
                        ? AppAssets.volumeHighIcon
                        : AppAssets.volumeCrossIcon,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
