import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islamiapp/core/utils/app_logic.dart';
import 'package:islamiapp/core/utils/app_router.dart';
import 'package:islamiapp/presentation/view/hadeth_card.dart';

class HadethTab extends StatefulWidget {
  HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();

}

class _HadethTabState extends State<HadethTab> {
  String hadethTitle = '';

  String hadeth = '';

  int currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Center(child: Image.asset(AppAssets.islamiOnBoarding)),
          CarouselSlider.builder(
            itemCount: 50,
            itemBuilder: (BuildContext context, int itemIndex,
                int pageViewIndex) {
              return FutureBuilder(
                  future: AppLogic.loadHadeth(itemIndex),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasError || !snapshot.hasData) {
                      return HadethCard(
                          hadethTitle: "خطأ", hadeth: "تعذر تحميل الحديث");
                    }
                    final hadethData = snapshot.data!;
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            AppRouter.hadethScreen, arguments: itemIndex);
                      },
                      child: HadethCard(hadethTitle: hadethData["title"]!,
                          hadeth: hadethData["hadeth"]!),
                    );
                  }
              );
            },
            options: CarouselOptions(
                height: 550.h,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  currentIndex = index;
                },
                initialPage: 2
            ),
          ),
        ],
      ),
    );
  }
}
