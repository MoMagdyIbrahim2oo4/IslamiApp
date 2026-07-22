import 'package:flutter/material.dart';
import 'package:islamiapp/core/constants/AppColors.dart';
import 'package:islamiapp/core/providers/most_recent_provider.dart';
import 'package:islamiapp/core/utils/app_router.dart';
import 'package:islamiapp/presentation/screens/main_layout_screen.dart';
import 'package:islamiapp/presentation/screens/onboarding_screen.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/presentation/screens/sura_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Wrapped with ChangeNotifierProvider (replace YourChangeNotifier with your actual provider class)[cite: 1]
    return ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: ScreenUtilPlusInit(
        designSize: const Size(430, 932),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.onboardingScreen,
          routes: {
            AppRouter.onboardingScreen: (context) => OnboardingScreen(),
            AppRouter.mainLayOutScreen: (context) => MainLayoutScreen(),
            AppRouter.suraScreen: (context) => SuraScreen(),
          },
          theme: ThemeData(
            scaffoldBackgroundColor: Appcolors.primary,
            appBarTheme: AppBarTheme(
              backgroundColor: Appcolors.primary,
              foregroundColor: Appcolors.gold,
              centerTitle: true,
            ),
          ),
        ),
      ),
    );
  }
}
