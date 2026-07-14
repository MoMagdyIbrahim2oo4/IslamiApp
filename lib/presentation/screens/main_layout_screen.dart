import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamiapp/core/constants/AppColors.dart';
import 'package:islamiapp/core/utils/app_logic.dart';

class MainLayoutScreen extends StatefulWidget {
  const MainLayoutScreen({super.key});

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Appcolors.gold,
        indicatorColor: Appcolors.primaryColor.withValues(alpha: 0.6),
        labelTextStyle: WidgetStateProperty.all(
          TextStyle(
            color: Colors.white,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedIndex: currentIndex,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: List.generate(
          5,
          (index) => NavigationDestination(
            icon: SvgPicture.asset(
              AppLogic.tabs[index].iconPath,
              colorFilter: ColorFilter.mode(
                Appcolors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            label: AppLogic.tabs[index].label,
            selectedIcon: SvgPicture.asset(
              AppLogic.tabs[index].iconPath,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
      ),
      body: Image.asset(
        AppLogic.tabs[currentIndex].backgroundImage,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
