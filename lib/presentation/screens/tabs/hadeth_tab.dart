import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:carousel_slider/carousel_slider.dart';
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

  Future<Map<String, String>> loadHadeth(int index) async {
    final hadethContent = await rootBundle.loadString(
        "assets/files/Hadeeth/h${index + 1}.txt");
    List<String>hadethList = hadethContent.trim().split("\n");
    String hadethTitle = hadethList.isNotEmpty ? hadethList[0] : "";
    String hadeth = hadethList.length > 1
        ? hadethList.sublist(1).join("\n")
        : "";
    return {"title": hadethTitle, "hadeth": hadeth};
  }

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
                  future: loadHadeth(itemIndex),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (snapshot.hasError || !snapshot.hasData) {
                      return HadethCard(
                          hadethTitle: "خطأ", hadeth: "تعذر تحميل الحديث");
                    }
                    final hadethData = snapshot.data!;
                    return HadethCard(hadethTitle: hadethData["title"]!,
                        hadeth: hadethData["hadeth"]!);
                  }
              );
            },
            options: CarouselOptions(
                height: 550.h,
                // autoPlay: true,
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
