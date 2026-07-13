import 'package:flutter/material.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:islamiapp/core/constants/AppColors.dart';
import 'package:islamiapp/core/utils/app_logic.dart';
import 'package:islamiapp/presentation/view/on_boarding_card.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
            padding: EdgeInsets.symmetric(horizontal: 5.7.w),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Visibility(
                          visible: currentIndex == 0,
                          replacement: TextButton(
                            onPressed: () {
                              controller.previousPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(
                                color: Appcolors.gold,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          child: SizedBox(),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SmoothPageIndicator(
                          controller: controller,
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
                          visible:
                              currentIndex !=
                              AppLogic.onboardinginfo.length - 1,
                          replacement: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Finish",
                              style: TextStyle(
                                color: Appcolors.gold,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          child: TextButton(
                            onPressed: () {
                              controller.nextPage(
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              "Next",
                              style: TextStyle(
                                color: Appcolors.gold,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
