import 'package:flutter/material.dart';
import 'package:shopnew/component/extension.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/colors.dart';
import '../res/dimens.dart';

class ProductBoxWidget extends StatelessWidget {
  const ProductBoxWidget({
    super.key,
    required this.productName,
    required this.price,
    this.discount = 0,
    this.discountOff = 0,
    this.time = "0",
  });

  final String productName;
  final int price;
  final int discount;
  final int discountOff;
  final String time;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(AppDimens.medium),
      padding: const EdgeInsets.all(AppDimens.medium),
      decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.hint,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(AppDimens.medium),
          gradient: const LinearGradient(
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
              colors: AppColors.productBgGradiant)),
      width: size.width * .5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.png.unnamed.path),
          AppDimens.medium.height,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              productName,
              style: LightAppTextStyle.title.copyWith(fontSize: 18),
            ),
          ),
          AppDimens.medium.height,
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
                        price.seprateWithComma,
                        style: LightAppTextStyle.title.copyWith(),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: discount > 0 ? true : false,
                    child: Row(
                      children: [
                        Text(
                          "تومان ",
                          style: LightAppTextStyle.title.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.hint),
                        ),
                        Text(
                          "${discount.seprateWithComma} ",
                          style: LightAppTextStyle.title.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.hint),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Visibility(
                visible: discount > 0 ? true : false,
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.small * .5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(AppDimens.small)),
                  child: Text(
                    "$discountOff %",
                    style: LightAppTextStyle.button,
                  ),
                ),
              ),
            ],
          ),
          AppDimens.medium.height,
          Visibility(
            visible: discount > 0 ? true : false,
            child: Container(
              height: 2.5,
              width: double.infinity,
              color: AppColors.primaryColor,
            ),
          ),
          AppDimens.small.height,
          Visibility(
            visible: discount > 0 ? true : false,
            child: Text(
              time,
              style: LightAppTextStyle.title
                  .copyWith(fontSize: 25, color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
