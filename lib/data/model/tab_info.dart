import 'package:flutter/material.dart';

class TabInfo {
  String iconPath;
  String backgroundImage;
  String label;
  Widget content;

  TabInfo({
    required this.label,
    required this.backgroundImage,
    required this.content,
    required this.iconPath,
  });
}
