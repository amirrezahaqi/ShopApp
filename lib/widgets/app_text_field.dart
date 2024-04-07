import 'package:flutter/material.dart';
import 'package:shopnew/component/extension.dart';

import '../res/dimens.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String prefix;
  final String hint;
  TextEditingController controller;
  final Widget icon;
  final TextAlign textAlign;
  TextInputType? inputType;
  AppTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.icon = const SizedBox(),
    this.textAlign = TextAlign.center,
    this.inputType,
    this.prefix = "",
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(AppDimens.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: size.width * .75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(prefix),
                Text(label),
              ],
            ),
          ),
          AppDimens.medium.height,
          SizedBox(
            height: size.height * .07,
            width: size.width * .75,
            child: TextField(
              textAlign: textAlign,
              controller: controller,
              keyboardType: inputType,
              decoration: InputDecoration(
                hintText: hint,
                prefix: icon,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
