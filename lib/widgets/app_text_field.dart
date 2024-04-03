import 'package:flutter/material.dart';
import 'package:shopnew/component/extension.dart';

import '../res/dimens.dart';

class AppTextField extends StatelessWidget {
  final String label;
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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.large),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(label),
          AppDimens.large.height,
          TextField(
            textAlign: textAlign,
            controller: controller,
            keyboardType: inputType,
            decoration: InputDecoration(
              hintText: hint,
              prefix: icon,
            ),
          ),
        ],
      ),
    );
  }
}
