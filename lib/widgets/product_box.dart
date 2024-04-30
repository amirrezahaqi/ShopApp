import 'package:flutter/material.dart';
import 'package:shopnew/component/extension.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';
import '../res/colors.dart';
import '../res/dimens.dart';

class ProductBoxWidget extends StatelessWidget {
  const ProductBoxWidget({
    super.key,
  });

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
              "ساعت مچی مردانه",
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
                        120000.seprateWithComma,
                        style: LightAppTextStyle.title.copyWith(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "تومان ",
                        style: LightAppTextStyle.title.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.hint),
                      ),
                      Text(
                        "${180000.seprateWithComma} ",
                        style: LightAppTextStyle.title.copyWith(
                            decoration: TextDecoration.lineThrough,
                            color: AppColors.hint),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(AppDimens.small * .5),
                decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(AppDimens.small)),
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
            style: LightAppTextStyle.title
                .copyWith(fontSize: 25, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
