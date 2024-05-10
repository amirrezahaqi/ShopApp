import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/colors.dart';
import 'package:shopnew/widgets/app_bar.dart';
import 'package:shopnew/widgets/cart_bridge.dart';

import '../component/text_style.dart';
import '../res/dimens.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

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
                const CartBadge(count: 2),
                Row(
                  children: [
                    const Text(
                      "ساعت مچی مردانه",
                      style: LightAppTextStyle.title,
                    ),
                    AppDimens.medium.width,
                    SvgPicture.asset(Assets.svg.close),
                  ],
                )
              ],
            ),
          )),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(),
                child: Image.asset(
                  fit: BoxFit.cover,
                  Assets.png.unnamed.path,
                ),
              ),
              AppDimens.medium.height,
              Container(
                width: size.width * .99,
                decoration: const BoxDecoration(
                    color: AppColors.btmNavColor,
                    borderRadius:
                        BorderRadius.all(Radius.circular(AppDimens.large))),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimens.large),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "ساعت مچی مردانه",
                        style: LightAppTextStyle.title,
                      ),
                      const Text(
                        "توضیحات محصول مورد نظر",
                        style: LightAppTextStyle.hint,
                      ),
                      const Divider(),
                      AppDimens.medium.height,
                      const ProductTabView()
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  var selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: AppDimens.large * 2,
      child: ListView.builder(
          itemCount: tabs.length,
          itemExtent: size.width / tabs.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.medium),
                  child: Text(
                    tabs[index],
                    style: selectedIndex == index
                        ? LightAppTextStyle.title
                        : LightAppTextStyle.hint,
                  ),
                ),
              )),
    );
  }
}

List<String> tabs = ["بررسی", "نظرات", "مشخصات"];
