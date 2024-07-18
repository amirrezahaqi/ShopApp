import 'package:flutter/material.dart';
import 'package:shopnew/component/extension.dart';

import '../component/text_style.dart';
import '../res/colors.dart';
import '../res/dimens.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.productName,
    required this.price,
    this.discount = 0,
    this.oldPrice = 0,
    this.specialExpiration = "2024-06-13 00:00:00",
    this.image = "",
  });

  final String productName;
  final int price;
  final int discount;
  final int oldPrice;
  final String specialExpiration;
  final String image;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  Duration _duration = const Duration(seconds: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DateTime now = DateTime.now();
    DateTime expiration = DateTime.parse(widget.specialExpiration);
    _duration = now.difference(expiration).abs();
    int hours = _duration.inHours;
    int minuts = _duration.inMinutes.remainder(60);
    int seconds = _duration.inSeconds.remainder(60);
    print("$hours:$minuts:$seconds");
  }

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
          color: AppColors.mainBg
          // gradient: const LinearGradient(
          //     end: Alignment.bottomCenter,
          //     begin: Alignment.topCenter,
          //     colors: AppColors.productBgGradiant)
          ),
      width: size.width * .7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: size.width * .4, child: Image.network(widget.image)),
          AppDimens.medium.height,
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.productName,
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
                        widget.price.seprateWithComma,
                        style: LightAppTextStyle.title.copyWith(),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: widget.discount > 0 ? true : false,
                    child: Row(
                      children: [
                        Text(
                          "تومان ",
                          style: LightAppTextStyle.title.copyWith(
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.hint),
                        ),
                        Text(
                          "${widget.discount.seprateWithComma} ",
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
                visible: widget.discount > 0 ? true : false,
                child: Container(
                  padding: const EdgeInsets.all(AppDimens.small * .5),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(AppDimens.small)),
                  child: Text(
                    "${widget.oldPrice} %",
                    style: LightAppTextStyle.button,
                  ),
                ),
              ),
            ],
          ),
          AppDimens.medium.height,
          Visibility(
            visible: _duration.inSeconds > 0 ? true : false,
            child: Container(
              height: 2.5,
              width: double.infinity,
              color: AppColors.primaryColor,
            ),
          ),
          AppDimens.small.height,
          Visibility(
            visible: _duration.inSeconds > 0 ? true : false,
            child: Text(
              widget.specialExpiration,
              style: LightAppTextStyle.title
                  .copyWith(fontSize: 25, color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
