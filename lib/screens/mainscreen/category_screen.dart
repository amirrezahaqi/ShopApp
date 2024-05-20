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

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
                  Assets.svg.category,
                ),
                Row(
                  children: [
                    const Text(
                      AppStrings.category,
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
                    AppDimens.large.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CatWidget(
                          iconPath: Assets.svg.clasic,
                          ontap: () {},
                          colors: AppColors.catClasicColors,
                          label: AppStrings.classic,
                        ),
                        CatWidget(
                          iconPath: Assets.svg.smart,
                          ontap: () {},
                          colors: AppColors.catDesktopColors,
                          label: AppStrings.desktop,
                        ),
                        CatWidget(
                          iconPath: Assets.svg.clasic,
                          ontap: () {},
                          colors: AppColors.catDigitalColors,
                          label: AppStrings.digital,
                        ),
                        CatWidget(
                          iconPath: Assets.svg.smart,
                          ontap: () {},
                          colors: AppColors.catSmartColors,
                          label: AppStrings.smart,
                        ),
                      ],
                    ),
                    AppDimens.large.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CatWidget(
                          iconPath: Assets.svg.clasic,
                          ontap: () {},
                          colors: AppColors.catClasicColors,
                          label: AppStrings.classic,
                        ),
                        CatWidget(
                          iconPath: Assets.svg.smart,
                          ontap: () {},
                          colors: AppColors.catDesktopColors,
                          label: AppStrings.desktop,
                        ),
                        CatWidget(
                          iconPath: Assets.svg.clasic,
                          ontap: () {},
                          colors: AppColors.catDigitalColors,
                          label: AppStrings.digital,
                        ),
                        CatWidget(
                          iconPath: Assets.svg.smart,
                          ontap: () {},
                          colors: AppColors.catSmartColors,
                          label: AppStrings.smart,
                        ),
                      ],
                    ),
                    AppDimens.large.height,
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
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
