import 'package:flutter/material.dart';
import 'package:shopnew/res/dimens.dart';

import '../res/colors.dart';

class AppButtonStyle {
  AppButtonStyle._();

  static ButtonStyle mainButtonStyle = ButtonStyle(
      textStyle: WidgetStateProperty.all(const TextStyle(
          decorationColor: AppColors.scaffoldBackgroundColor,
          fontSize: AppDimens.large,
          color: AppColors.focusedTextField)),
      backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppDimens.medium))));
}
