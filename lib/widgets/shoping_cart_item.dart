import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/text_style.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/colors.dart';
import 'package:shopnew/res/dimens.dart';

class ShopingCartItem extends StatelessWidget {
  ShopingCartItem({
    super.key,
    required this.count,
    required this.productTitle,
    this.add,
    this.remove,
    this.delete,
    // required this.price,
    // required this.oldPrice,
  });

  int count = 0;
  final productTitle;
  final add;
  final remove;
  final delete;
  // final int price;
  // final int oldPrice;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor, width: .5),
          color: AppColors.btmNavColor,
          borderRadius:
              const BorderRadius.all(Radius.circular(AppDimens.medium))),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.medium * 1.5),
        child: Column(
          children: [
            Text(
              productTitle,
              textDirection: TextDirection.rtl,
              style: LightAppTextStyle.title,
            ),
            // Text(
            //   "قیمت : $price تومان",
            //   style: LightAppTextStyle.hint,
            //   overflow: TextOverflow.clip,
            // ),
            // Text(
            //   "با تخفیف : $oldPrice تومان",
            //   style: LightAppTextStyle.falsenumber,
            //   overflow: TextOverflow.clip,
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: delete,
                    icon: SvgPicture.asset(
                      Assets.svg.delete,
                      colorFilter: const ColorFilter.mode(
                          AppColors.red, BlendMode.srcIn),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: add,
                      icon: SvgPicture.asset(
                        Assets.svg.plus,
                        colorFilter: const ColorFilter.mode(
                            AppColors.borderColor, BlendMode.srcIn),
                      ),
                    ),
                    Text(
                      " $count عدد",
                      textDirection: TextDirection.rtl,
                      style: LightAppTextStyle.title,
                    ),
                    IconButton(
                        onPressed: remove,
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
      ),
    );
  }
}
