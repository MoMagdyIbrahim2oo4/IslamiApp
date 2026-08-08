import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/core/constants/app_text_style.dart';
import 'package:islamiapp/core/utils/shared_pref.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/AppColors.dart';
import '../../core/utils/app_logic.dart';
import '../../core/utils/app_router.dart';

class OnboardingBottomBar extends StatefulWidget {
  PageController controller;
  int currentIndex;

  OnboardingBottomBar({
    super.key,
    required this.controller,
    required this.currentIndex,
  });

  @override
  State<OnboardingBottomBar> createState() => _OnboardingBottomBarState();
}

class _OnboardingBottomBarState extends State<OnboardingBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 1,
          child: Visibility(
            visible: widget.currentIndex == 0,
            replacement: TextButton(
              onPressed: () {
                widget.controller.previousPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              child: Text("Back", style: AppTextStyle.bold16Gold),
            ),
            child: SizedBox(),
          ),
        ),
        Expanded(
          flex: 2,
          child: SmoothPageIndicator(
            controller: widget.controller,
            count: AppLogic.onboardinginfo.length,
            effect: ExpandingDotsEffect(
              dotColor: Color(0xFF707070),
              activeDotColor: Appcolors.gold,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Visibility(
            visible: widget.currentIndex != AppLogic.onboardinginfo.length - 1,
            replacement: TextButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).pushReplacementNamed(AppRouter.mainLayOutScreen);
              },
              child: Text("Finish", style: AppTextStyle.bold16Gold),
            ),
            child: TextButton(
              onPressed: () {
                widget.controller.nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
                SharedPref.setSeen();
              },
              child: Text("Next", style: AppTextStyle.bold16Gold),
            ),
          ),
        ),
      ],
    );
  }
}
