import 'package:flutter/material.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/colors.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/res/strings.dart';

import '../../widgets/app_slider.dart';
import '../../widgets/cat_widget.dart';
import '../../widgets/searchbar_widget.dart';
import '../../widgets/vertical_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(
              ontap: () {},
            ),
            const AppSlider(),
            AppDimens.medium.height,
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
            AppDimens.medium.height,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: SizedBox(
                height: 300,
                child: Row(
                  children: [
                    ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        margin: const EdgeInsets.all(AppDimens.medium),
                        color: Colors.black,
                        height: 200,
                        width: 200,
                      ),
                    ),
                    const VerticalText(),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
