import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../core/constants/AppColors.dart';
import '../../core/constants/app_text_style.dart';
import '../../data/resources/radio_resources.dart';

class SegmentationButton extends StatefulWidget {
  Set<List<String>> selected;
  ValueChanged<Set<List<String>>> onButtonClick;

  SegmentationButton({
    super.key,
    required this.selected,
    required this.onButtonClick,
  });

  @override
  State<SegmentationButton> createState() => _SegmentationButtonState();
}

class _SegmentationButtonState extends State<SegmentationButton> {
  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      segments: <ButtonSegment<List<String>>>[
        ButtonSegment(value: RadioResources.radiosList, label: Text("Radio")),
        ButtonSegment(
          value: RadioResources.recitersList,
          label: Text("Reciters"),
        ),
      ],
      selected: widget.selected,
      onSelectionChanged: widget.onButtonClick,
      showSelectedIcon: false,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return Appcolors.gold;
          }
          return Appcolors.primary;
        }),
        shape: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return RoundedSuperellipseBorder(
              borderRadius: BorderRadiusGeometry.circular(12.r),
              side: BorderSide(color: Colors.transparent),
            );
          }
          return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
            side: const BorderSide(color: Colors.grey),
          );
        }),
        textStyle: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return AppTextStyle.bold16Primary;
          } else {
            return AppTextStyle.Regular16White;
          }
        }),
        foregroundColor: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return Appcolors.primary;
          } else {
            return Appcolors.white;
          }
        }),
      ),
    );
  }
}
