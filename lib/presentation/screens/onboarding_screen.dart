import 'package:flutter/material.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:islamiapp/core/constants/AppColors.dart';
import 'package:islamiapp/core/utils/app_logic.dart';
import 'package:islamiapp/presentation/view/on_boarding_card.dart';
import 'package:islamiapp/presentation/widgets/onboarding%20_bottom_bar.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.primaryColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAssets.islamiOnBoarding),
                Expanded(
                  flex: 8,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    controller: controller,
                    itemCount: AppLogic.onboardinginfo.length,
                    itemBuilder: (context, index) {
                      return OnBoardingCard(
                        image: AppLogic.onboardinginfo[index].image,
                        title: AppLogic.onboardinginfo[index].title,
                        description: AppLogic.onboardinginfo[index].description,
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: OnboardingBottomBar(
                    controller: controller,
                    currentIndex: currentIndex,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
