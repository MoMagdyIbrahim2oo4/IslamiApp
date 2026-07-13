import 'package:flutter/material.dart';
import 'package:islamiapp/core/utils/app_router.dart';
import 'package:islamiapp/presentation/screens/main_layout_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRouter.mainLayOutScreen,
      routes: {
        AppRouter.mainLayOutScreen:(context)=>MainLayoutScreen()
      },
    );
  }
}
