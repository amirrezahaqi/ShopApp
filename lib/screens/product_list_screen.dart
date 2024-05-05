import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/res/colors.dart';
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
                  const CartBadge(
                    count: 12,
                  ),
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

class CartBadge extends StatelessWidget {
  const CartBadge({super.key, required this.count});
  final count;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(
          height: 30,
          width: 30,
        ),
        SvgPicture.asset(
          Assets.svg.basket,
        ),
        Visibility(
          visible: count > 0 ? true : false,
          child: Positioned(
            top: 5,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  border: Border.all(width: 2, color: AppColors.appbar)),
              child: Padding(
                padding: const EdgeInsets.all(2.5),
                child: Text(
                  count.toString(),
                  style: LightAppTextStyle.button.copyWith(fontSize: 10),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
