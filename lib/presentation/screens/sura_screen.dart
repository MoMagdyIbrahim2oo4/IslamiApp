import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:islamiapp/core/constants/AppColors.dart';
import 'package:islamiapp/core/constants/app_text_style.dart';
import 'package:islamiapp/core/utils/app_logic.dart';

class SuraScreen extends StatefulWidget {
  SuraScreen({super.key});

  @override
  State<SuraScreen> createState() => _SuraScreenState();
}

class _SuraScreenState extends State<SuraScreen> {
  List<String> suraVerses = [];
  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => readSuraFile(index));
  }

  @override
  Widget build(BuildContext context) {
    index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLogic.suraList[index].englishQuranSuras,
          style: AppTextStyle.bold20Gold,
        ),
      ),
      body: Stack(
        children: [
          Image.asset(AppAssets.suraBackground),
          Center(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLogic.suraList[index].arabicQuranSuras,
                  style: AppTextStyle.bold24Gold,
                ),
                SizedBox(height: 60.h),
                Visibility(
                  visible: !suraVerses.isEmpty,
                  replacement: CircularProgressIndicator(
                    color: Appcolors.gold,),
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          TextSpan(
                            children: [
                              for (int i = 0; i < suraVerses.length; i++) ...[
                                TextSpan(
                                  text: suraVerses[i],
                                  style: AppTextStyle.bold20Gold,
                                ),
                                TextSpan(
                                  text: "[${i + 1}]",
                                  style: AppTextStyle.bold20Gold,
                                ),
                              ],
                            ],
                          ),
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
    );
  }

  readSuraFile(int index) async {
    String suraContent = await rootBundle.loadString(
      "assets/files/Suras/${index + 1}.txt",
    );
    setState(() {
      suraVerses = suraContent.trim().split("\n");
    });
  }
}
