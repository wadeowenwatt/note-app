import 'package:flutter/material.dart';
import 'package:testing/model/screen_theme.dart';

class AppColor {

  AppColor._();
  static const Color darkPrimary = Color(0xFF3A3F47);
  static const Color lightPrimary = Color(0xFFEEEEEE);
  static const Color lightSecondary = Color(0xFFD6E3E3);
  static const Color lightPlaceholder = Color(0xFF638787);
  static const Color redAccent = Color(0xFFD65B32);
  static const Color greenAccent = Color(0xFF8B9A47);

  static final ScreenTheme themeLight = ScreenTheme(
    backgroundColor: AppColor.lightPrimary,
    textColor: AppColor.darkPrimary,
  );

  static final ScreenTheme themeDark = ScreenTheme(
    backgroundColor: AppColor.darkPrimary,
    textColor: AppColor.lightPrimary,
  );
}