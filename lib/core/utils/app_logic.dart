import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamiapp/core/constants/AppAssets.dart';
import 'package:islamiapp/data/model/hadeth_item.dart';
import 'package:islamiapp/data/model/on_boarding_info.dart';
import 'package:islamiapp/data/model/sura_item.dart';
import 'package:islamiapp/data/model/tab_info.dart';
import 'package:islamiapp/data/resources/quran_resources.dart';
import 'package:islamiapp/presentation/screens/tabs/hadeth_tab.dart';
import 'package:islamiapp/presentation/screens/tabs/quran-tab.dart';
import 'package:islamiapp/presentation/screens/tabs/sebha_tab.dart';

abstract class AppLogic {
  static List<OnBoardingInfo> onboardinginfo = [
    OnBoardingInfo(
      image: AppAssets.onBoarding1,
      description: "Welcome To Islmi App",
    ),
    OnBoardingInfo(
      image: AppAssets.onBoarding2,
      title: "Welcome To Islami",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    OnBoardingInfo(
      image: AppAssets.onBoarding3,
      title: "Reading the Quran",
      description: "Read, and your Lord is the Most Generous",
    ),
    OnBoardingInfo(
      image: AppAssets.onBoarding4,
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
    ),
    OnBoardingInfo(
      image: AppAssets.onBoarding5,
      title: "Holy Quran Radio",
      description:
      "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
  static List<TabInfo>tabs = [
    TabInfo(label: "َQuran",
        backgroundImage: AppAssets.quranBackground,
        content: QuranTab(),
        iconPath: AppAssets.quranIcon),
    TabInfo(label: "Hadeth",
        backgroundImage: AppAssets.hadethBackground,
        content: HadethTab(),
        iconPath: AppAssets.hadethIcon),
    TabInfo(label: "Sebha",
        backgroundImage: AppAssets.sebhaBackground,
        content: SebhaTab(),
        iconPath: AppAssets.sebhaIcon),
    TabInfo(label: "Radio",
        backgroundImage: AppAssets.radioBackground,
        content: Container(),
        iconPath: AppAssets.radioIcon),
    TabInfo(label: "Time",
        backgroundImage: AppAssets.timeBackground,
        content: Container(),
        iconPath: AppAssets.timeIcon)
  ];
  static List<SuraItem>suraList = List.generate(114, (index) =>
      SuraItem(arabicQuranSuras: QuranResources.arabicQuranSuras[index],
          englishQuranSuras: QuranResources.englishQuranSuras[index],
          AyaNumbers: QuranResources.AyaNumbers[index],
          numberOfSura: (index + 1).toString()
      )
  );

  static Future<Map<String, String>> loadHadeth(int index) async {
    final hadethContent = await rootBundle.loadString(
        "assets/files/Hadeeth/h${index + 1}.txt");
    List<String>hadethList = hadethContent.trim().split("\n");
    String hadethTitle = hadethList.isNotEmpty ? hadethList[0] : "";
    String hadeth = hadethList.length > 1
        ? hadethList.sublist(1).join("\n")
        : "";
    return {"title": hadethTitle, "hadeth": hadeth};
  }
}
