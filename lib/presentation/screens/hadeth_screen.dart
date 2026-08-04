import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:islamiapp/core/constants/app_text_style.dart';
import 'package:islamiapp/core/utils/app_logic.dart';

class HadethScreen extends StatefulWidget {
  HadethScreen({super.key});

  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  late int index;

  @override
  Widget build(BuildContext context) {
    index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(title: Text("Hadith 1"), scrolledUnderElevation: 0),
      body: Stack(
        children: [
          Image.asset(AppAssets.suraBackground, fit: BoxFit.cover),
          Center(
            child: FutureBuilder(
              future: AppLogic.loadHadeth(index),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError || !snapshot.hasData) {
                  return Text(
                    "تعذر تحميل الحديث",
                    style: AppTextStyle.bold24Gold,
                  );
                }
                final hadethContent = snapshot.data!;
                return Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      hadethContent["title"] ?? "",
                      style: AppTextStyle.bold24Gold,
                    ),
                    SizedBox(height: 60.h),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(25.r),
                          child: Text.rich(
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: hadethContent['hadeth'],
                                  style: AppTextStyle.bold20Gold.copyWith(
                                    height: 3.h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
