import 'package:flutter/material.dart';
import 'package:testing/configs/app_color.dart';

class AppTextStyle {
  AppTextStyle._();

  static const TextStyle headerMainStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 36,
    color: AppColor.darkPrimary,
  );

  static const TextStyle semiBoldStyle = TextStyle(
    color: AppColor.darkPrimary,
    fontWeight: FontWeight.w600,
  );

}
