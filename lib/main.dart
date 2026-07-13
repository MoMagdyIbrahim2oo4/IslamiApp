import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:islamiapp/core/utils/app_router.dart';
import 'package:islamiapp/presentation/screens/main_layout_screen.dart';
import 'package:islamiapp/presentation/screens/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.onboardingScreen,
          routes: {
            AppRouter.onboardingScreen: (context) => OnboardingScreen(),
            AppRouter.mainLayOutScreen: (context) => MainLayoutScreen(),
          },
        );
      },
    );
  }
}
