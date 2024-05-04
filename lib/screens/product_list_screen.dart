import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/res/dimens.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';
import '../widgets/app_bar.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.medium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(Assets.svg.basket),
                  Row(
                    children: [
                      const Text("پروفروش ترین محصولات",
                          style: LightAppTextStyle.title),
                      AppDimens.small.width,
                      SvgPicture.asset(Assets.svg.sort),
                    ],
                  ),
                  SvgPicture.asset(Assets.svg.close)
                ],
              ),
            ),
          ),
          body: const Center(
            child: Text("لیست محصولات", style: LightAppTextStyle.title),
          )),
    );
  }
}
