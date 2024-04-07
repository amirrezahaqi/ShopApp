import 'package:flutter/material.dart';
import 'package:shopnew/res/colors.dart';

import '../component/button_style.dart';

class MainButton extends StatelessWidget {
  void Function() onPressed;
  final String text;

  MainButton({super.key, required this.onPressed, required this.text});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height * .07,
        width: size.width * .75,
        child: ElevatedButton(
            style: AppButtonStyle.mainButtonStyle,
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(color: AppColors.mainButtonText),
            )));
  }
}
