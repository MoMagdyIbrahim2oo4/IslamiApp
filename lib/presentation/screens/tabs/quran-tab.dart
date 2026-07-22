import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:islamiapp/core/constants/app_text_style.dart';
import 'package:islamiapp/core/providers/most_recent_provider.dart';
import 'package:islamiapp/core/utils/shared_pref.dart';
import 'package:islamiapp/presentation/widgets/most_recently.dart';
import 'package:islamiapp/presentation/widgets/quran_text_field.dart';
import 'package:islamiapp/presentation/widgets/sura_list.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  late MostRecentProvider mostRecentProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => mostRecentProvider.loadMostRecent(),
    );
  @override
  Widget build(BuildContext context) {
    mostRecentProvider = Provider.of(context, listen: true);
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10.h,
          children: [
            Center(child: Image.asset(AppAssets.islamiOnBoarding)),
            QuranTextField(),
            Text("Most Recently", style: AppTextStyle.bold16White),
            MostRecently(suras: mostRecentProvider.mostRecent,),
            Text("Suras List", style: AppTextStyle.bold16White),
            SizedBox(
              height: 500.h,
              child: Expanded(child: SuraList()),
            ),
          ],
        ),
      ),
    );
  }
}
