import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/text_style.dart';
import 'package:shopnew/res/strings.dart';

import '../gen/assets.gen.dart';

class VerticalText extends StatelessWidget {
  const VerticalText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                  angle: 1.5, child: SvgPicture.asset(Assets.svg.back)),
              const Text(
                AppStrings.viewAll,
                style: LightAppTextStyle.title,
              )
            ],
          ),
          Text(
            AppStrings.topSells,
            style: LightAppTextStyle.title
                .copyWith(fontSize: 30, color: Colors.red),
          )
        ],
      ),
    );
  }
}
