import 'package:flutter/material.dart';
import 'package:islamiapp/core/utils/app_router.dart';
import 'package:islamiapp/presentation/screens/main_layout_screen.dart';
import 'package:islamiapp/presentation/screens/onboarding_screen.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(430, 932),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRouter.onboardingScreen,
        routes: {
          AppRouter.onboardingScreen: (context) => OnboardingScreen(),
          AppRouter.mainLayOutScreen: (context) => MainLayoutScreen(),
        },
      ),
    );
  }
}
