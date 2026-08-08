import 'package:flutter/material.dart';
import 'package:islamiapp/core/constants/AppColors.dart';
import 'package:islamiapp/core/providers/most_recent_provider.dart';
import 'package:islamiapp/core/utils/app_router.dart';
import 'package:islamiapp/core/utils/shared_pref.dart';
import 'package:islamiapp/presentation/screens/hadeth_screen.dart';
import 'package:islamiapp/presentation/screens/main_layout_screen.dart';
import 'package:islamiapp/presentation/screens/onboarding_screen.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/presentation/screens/sura_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool seen = await SharedPref.getSeen();
  runApp(MyApp(seen: seen));
}

class MyApp extends StatelessWidget {
  bool seen;

  MyApp({super.key, required this.seen});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: ScreenUtilPlusInit(
        designSize: const Size(430, 932),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: seen
              ? AppRouter.mainLayOutScreen
              : AppRouter.onboardingScreen,
          routes: {
            AppRouter.onboardingScreen: (context) => OnboardingScreen(),
            AppRouter.mainLayOutScreen: (context) => MainLayoutScreen(),
            AppRouter.suraScreen: (context) => SuraScreen(),
            AppRouter.hadethScreen: (context) => HadethScreen(),
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
