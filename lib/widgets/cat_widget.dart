import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/res/dimens.dart';

import '../component/text_style.dart';

class CatWidget extends StatelessWidget {
  const CatWidget({
    super.key,
    required this.iconPath,
    required this.ontap,
    required this.colors,
    required this.label,
  });
  final iconPath;
  final ontap;
  final colors;
  final label;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppDimens.large),
              color: colors,
            ),
            height: size.height * 0.085,
            width: size.height * 0.085,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: AppDimens.large * 2.5,
                  child: Image.network(
                    iconPath,
                    // color: AppColors.scaffoldBackgroundColor,
                  ),
                ),
              ],
            ),
          ),
          AppDimens.small.height,
          Text(
            label,
            style: LightAppTextStyle.title,
          )
        ],
      ),
    );
  }
}
