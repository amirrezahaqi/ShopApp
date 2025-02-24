import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/data/model/product.dart';
import 'package:shopnew/screens/product_single/product_single_screen.dart';
import 'package:shopnew/utils/format_time.dart';

import '../component/text_style.dart';
import '../res/colors.dart';
import '../res/dimens.dart';

// ignore: must_be_immutable
class ProductItem extends StatefulWidget {
  ProductItem({super.key, required this.product});

  Product product;
  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  Duration _duration = const Duration(seconds: 0);
  // ignore: unused_field
  late Timer _timer;
  int insecond = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer(_duration, () {});
    if (widget.product.specialExpiration != "") {
      DateTime now = DateTime.now();
      DateTime expiration = DateTime.parse(widget.product.specialExpiration);
      _duration = now.difference(expiration).abs();
      insecond = _duration.inSeconds;
      startTime();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductSingleScreen(
                id: widget.product.id,
              ),
            ));
      },
      child: Container(
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
            SizedBox(
                width: size.width * .4,
                child: Image.network(widget.product.image)),
            AppDimens.medium.height,
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                textAlign: TextAlign.right,
                widget.product.title,
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
                          widget.product.price.seprateWithComma,
                          style: LightAppTextStyle.title.copyWith(),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: widget.product.discount > 0 ? true : false,
                      child: Row(
                        children: [
                          Text(
                            "تومان ",
                            style: LightAppTextStyle.title.copyWith(
                                decoration: TextDecoration.lineThrough,
                                color: AppColors.hint),
                          ),
                          Text(
                            "${widget.product.discount.seprateWithComma} ",
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
                  visible: widget.product.discount > 0 ? true : false,
                  child: Container(
                    padding: const EdgeInsets.all(AppDimens.small * .5),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(AppDimens.small)),
                    child: Text(
                      "${widget.product.discount} %",
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
                formatTime(insecond),
                style: LightAppTextStyle.title
                    .copyWith(fontSize: 25, color: AppColors.primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startTime() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (insecond == 0) {
          debugPrint("product ontap limited");
        } else {
          insecond--;
        }
      });
    });
  }
}
