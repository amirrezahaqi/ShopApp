import 'package:flutter/material.dart';
import 'package:shopnew/gen/fonts.gen.dart';
import 'package:shopnew/res/colors.dart';

class LightAppTextStyle {
  LightAppTextStyle._();

  static const TextStyle title = TextStyle(
      fontFamily: FontFamily.peyda,
      fontSize: 14,
      color: AppColors.title,
      fontWeight: FontWeight.bold);
  static const TextStyle btmNavActiveItem = TextStyle(
      fontFamily: FontFamily.peyda,
      fontSize: 12,
      color: AppColors.btmNavActiveItem,
      fontWeight: FontWeight.bold);
  static const TextStyle btmNavInActiveItem = TextStyle(
      fontFamily: FontFamily.peyda,
      fontSize: 12,
      color: AppColors.btmNavInActiveItem,
      fontWeight: FontWeight.bold);

  static const TextStyle falsenumber = TextStyle(
      fontFamily: FontFamily.peyda,
      fontSize: 14,
      color: AppColors.primaryColor,
      fontWeight: FontWeight.bold);
  static const TextStyle button = TextStyle(
      fontFamily: FontFamily.peyda,
      fontSize: 14,
      color: AppColors.mainButtonText);
  static const TextStyle hint = TextStyle(
      fontFamily: FontFamily.peyda, fontSize: 14, color: AppColors.hint);
}
