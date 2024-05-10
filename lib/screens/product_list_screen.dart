import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/widgets/product_box.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';
import '../widgets/app_bar.dart';
import '../widgets/cart_bridge.dart';
import '../widgets/cart_tags.dart';

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
          body: Column(
            children: [
              AppDimens.medium.height,
              const CatTags(),
              AppDimens.medium.height,
              const ProductListGridView()
            ],
          )),
    );
  }
}

class ProductListGridView extends StatelessWidget {
  const ProductListGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .7,
              crossAxisCount: 2,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2),
          itemCount: 20,
          itemBuilder: (context, i) {
            return const ProductBoxWidget(
                productName: "ساعت مچی مردانه", price: 100000);
          }),
    );
  }
}
