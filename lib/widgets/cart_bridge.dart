import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/colors.dart';

import '../component/text_style.dart';

class CartBadge extends StatelessWidget {
  const CartBadge({super.key, required this.count});
  // ignore: prefer_typing_uninitialized_variables
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
            top: 1,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                  border: Border.all(width: 2, color: AppColors.appbar)),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  count.toString(),
                  style: LightAppTextStyle.button.copyWith(fontSize: 15),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
