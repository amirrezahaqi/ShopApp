import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/extension.dart';

import '../component/text_style.dart';
import '../res/colors.dart';
import '../res/dimens.dart';

class BtmNavItem extends StatelessWidget {
  String svgAssets;
  String labelText;
  void Function() ontap;
  bool isActive;

  BtmNavItem({
    super.key,
    required this.svgAssets,
    required this.labelText,
    required this.ontap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(AppDimens.medium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                height: AppDimens.large,
                svgAssets,
                colorFilter: ColorFilter.mode(
                    isActive
                        ? AppColors.btmNavActiveItem
                        : AppColors.btmNavInActiveItem,
                    BlendMode.srcIn),
              ),
              AppDimens.small.height,
              Text(labelText,
                  style: isActive
                      ? LightAppTextStyle.btmNavActiveItem
                      : LightAppTextStyle.btmNavInActiveItem)
            ],
          ),
        ),
      ),
    );
  }
}
