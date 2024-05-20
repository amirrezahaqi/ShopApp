import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/strings.dart';
import 'package:shopnew/widgets/app_bar.dart';

import '../../component/text_style.dart';
import '../../res/colors.dart';
import '../../res/dimens.dart';
import '../../widgets/cat_widget.dart';
import '../../widgets/setting_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
              child: Padding(
            padding: const EdgeInsets.all(AppDimens.medium),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  Assets.svg.user,
                ),
                Row(
                  children: [
                    const Text(
                      AppStrings.profile,
                      style: LightAppTextStyle.title,
                    ),
                    AppDimens.medium.width,
                  ],
                )
              ],
            ),
          )),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    AppDimens.medium.height,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(1000),
                      child: SvgPicture.asset(
                        Assets.svg.avatar,
                        width: size.width * .3,
                      ),
                    ),
                    AppDimens.medium.height,
                    const Text(
                      "امیررضا جلوس حقی",
                      style: LightAppTextStyle.title,
                    ),
                    AppDimens.medium.height,
                    SettingItem(
                      size: size,
                      title: AppStrings.address,
                      description: AppStrings.lurem,
                      icon: Assets.svg.location,
                      onTap: () {},
                    ),
                    SettingItem(
                      size: size,
                      title: AppStrings.nameLastName,
                      description: AppStrings.lurem,
                      icon: Assets.svg.user,
                      onTap: () {},
                    ),
                    SettingItem(
                      size: size,
                      title: AppStrings.homeNumber,
                      description: AppStrings.lurem,
                      icon: Assets.svg.phone,
                      onTap: () {},
                    ),
                    SettingItem(
                      size: size,
                      title: AppStrings.postalCode,
                      description: AppStrings.lurem,
                      icon: Assets.svg.postalCode,
                      onTap: () {},
                    ),
                    SettingItem(
                      size: size,
                      title: AppStrings.termOfService,
                      description: AppStrings.lurem,
                      icon: Assets.svg.terms,
                      onTap: () {},
                    ),
                    AppDimens.large.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CatWidget(
                          iconPath: Assets.svg.cancelled,
                          ontap: () {},
                          colors: AppColors.catClasicColors,
                          label: AppStrings.cancelled,
                        ),
                        CatWidget(
                          iconPath: Assets.svg.inProccess,
                          ontap: () {},
                          colors: AppColors.catClasicColors,
                          label: AppStrings.inProccess,
                        ),
                        CatWidget(
                          iconPath: Assets.svg.delivered,
                          ontap: () {},
                          colors: AppColors.catClasicColors,
                          label: AppStrings.delivered,
                        ),
                      ],
                    ),
                    AppDimens.large.height
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
