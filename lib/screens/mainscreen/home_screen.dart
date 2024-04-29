import 'package:flutter/material.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/component/text_style.dart';
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
                    AppDimens.large.height,
                    ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        margin: const EdgeInsets.all(AppDimens.medium),
                        padding: const EdgeInsets.all(AppDimens.medium),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.hint,
                              width: 1,
                            ),
                            borderRadius:
                                BorderRadius.circular(AppDimens.medium),
                            gradient: const LinearGradient(
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter,
                                colors: AppColors.productBgGradiant)),
                        height: 300,
                        width: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(Assets.png.unnamed.path),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "ساعت مچی مردانه",
                                style: LightAppTextStyle.title
                                    .copyWith(fontSize: 18),
                              ),
                            ),
                            AppDimens.medium.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "۱۲۰۰۰۰ تومان",
                                      style: LightAppTextStyle.title.copyWith(),
                                    ),
                                    Text(
                                      "تومان  ۱۸۰۰۰۰ ",
                                      style: LightAppTextStyle.title.copyWith(
                                          decorationStyle:
                                              TextDecorationStyle.solid,
                                          color: AppColors.hint),
                                    )
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.all(
                                      AppDimens.small * .5),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(
                                          AppDimens.small)),
                                  child: const Text(
                                    " %۲۰ ",
                                    style: LightAppTextStyle.button,
                                  ),
                                ),
                              ],
                            ),
                            AppDimens.medium.height,
                            Container(
                              height: 2.5,
                              width: double.infinity,
                              color: AppColors.primaryColor,
                            ),
                            AppDimens.small.height,
                            Text(
                              "20:10:00",
                              style: LightAppTextStyle.title.copyWith(
                                  fontSize: 18, color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(AppDimens.large),
                      child: VerticalText(),
                    ),
                  ],
                ),
              ),
            ),
            AppDimens.large.height,
          ],
        ),
      )),
    );
  }
}
