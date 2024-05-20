import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopnew/component/extension.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/colors.dart';
import '../res/dimens.dart';

class SettingItem extends StatelessWidget {
  SettingItem({
    super.key,
    required this.size,
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  final Size size;
  final String title;
  final String description;
  final icon;
  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.small),
        child: Container(
          width: size.width * .99,
          decoration: const BoxDecoration(
              color: AppColors.btmNavColor,
              borderRadius:
                  BorderRadius.all(Radius.circular(AppDimens.medium))),
          child: Padding(
            padding: const EdgeInsets.all(AppDimens.medium * 1.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  Assets.svg.leftArrow,
                  colorFilter: const ColorFilter.mode(
                      AppColors.borderColor, BlendMode.srcIn),
                ),
                AppDimens.large.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: LightAppTextStyle.title,
                      ),
                      FittedBox(
                        child: Text(
                          description,
                          style: LightAppTextStyle.hint,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
                AppDimens.large.width,
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(1000)),
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimens.medium),
                      child: SvgPicture.asset(
                        icon,
                        colorFilter: const ColorFilter.mode(
                            AppColors.mainBg, BlendMode.srcIn),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
