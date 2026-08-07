import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:islamiapp/data/resources/radio_resources.dart';
import 'package:islamiapp/presentation/view/radio_card.dart';
import 'package:islamiapp/presentation/widgets/segmentation_button.dart';

import '../../../core/constants/AppAssets.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  Set<List<String>> selected = {RadioResources.radiosList};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Center(child: Image.asset(AppAssets.islamiOnBoarding)),
          SizedBox(
            width: double.infinity,
            child: SegmentationButton(
              selected: selected,
              onButtonClick: (nweSelected) {
                setState(() {
                  selected = nweSelected;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) =>
                  RadioCard(name: selected.first[index]),
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemCount: selected.first.length,
            ),
          ),
        ],
      ),
    );
  }
}
