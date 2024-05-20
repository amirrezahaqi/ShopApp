import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/colors.dart';
import 'package:shopnew/res/strings.dart';
import 'package:shopnew/widgets/app_bar.dart';
import 'package:shopnew/widgets/cart_bridge.dart';

import '../../component/text_style.dart';
import '../../res/dimens.dart';
import '../../widgets/main_button.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

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
                      AppStrings.basket,
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
                    Padding(
                      padding: const EdgeInsets.all(AppDimens.medium),
                      child: Container(
                        width: size.width * .99,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.borderColor, width: .5),
                            color: AppColors.btmNavColor,
                            borderRadius: const BorderRadius.all(
                                Radius.circular(AppDimens.medium))),
                        child: Padding(
                          padding: const EdgeInsets.all(AppDimens.medium * 1.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(Assets.svg.leftArrow),
                              AppDimens.medium.width,
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      "ارسال به آدرس",
                                      style: LightAppTextStyle.title,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        AppStrings.lurem,
                                        style: LightAppTextStyle.hint,
                                        overflow: TextOverflow.clip,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.all(AppDimens.medium),
                        child: ShopingCartItem(size: size),
                      ),
                      itemCount: 20,
                    ),
                    AppDimens.large2x.height
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: AppColors.appbar,
                  height: 70,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "تومان",
                                      style: LightAppTextStyle.title.copyWith(),
                                    ),
                                    Text(
                                      100000.seprateWithComma,
                                      style: LightAppTextStyle.title.copyWith(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "تومان ",
                                      style: LightAppTextStyle.title.copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: AppColors.hint),
                                    ),
                                    Text(
                                      120000.seprateWithComma,
                                      style: LightAppTextStyle.title.copyWith(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: AppColors.hint),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.all(AppDimens.small * .5),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.circular(AppDimens.small)),
                              child: const Text(
                                "20%",
                                style: LightAppTextStyle.button,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: size.width * .3,
                          child: MainButton(
                            text: "ادامه خرید",
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

class ShopingCartItem extends StatelessWidget {
  const ShopingCartItem({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .99,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor, width: .5),
          color: AppColors.btmNavColor,
          borderRadius:
              const BorderRadius.all(Radius.circular(AppDimens.medium))),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.medium * 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "ساعت مچی مردانه و زنانه",
                        style: LightAppTextStyle.title,
                      ),
                      const Text(
                        "قیمت : 20000 تومان",
                        style: LightAppTextStyle.hint,
                        overflow: TextOverflow.clip,
                      ),
                      const Text(
                        "با تخفیف : 10000 تومان",
                        style: LightAppTextStyle.falsenumber,
                        overflow: TextOverflow.clip,
                      ),
                      AppDimens.medium.width,
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                Assets.svg.delete,
                                colorFilter: const ColorFilter.mode(
                                    AppColors.red, BlendMode.srcIn),
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  Assets.svg.plus,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.borderColor, BlendMode.srcIn),
                                ),
                              ),
                              const Text(
                                "عدد 0",
                                style: LightAppTextStyle.title,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: SvgPicture.asset(
                                    Assets.svg.minus,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.borderColor, BlendMode.srcIn),
                                  ))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            AppDimens.medium.width,
            Image.asset(Assets.png.unnamed.path)
          ],
        ),
      ),
    );
  }
}
