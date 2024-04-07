import 'package:flutter/material.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/res/strings.dart';

import '../gen/assets.gen.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: Image.asset(Assets.png.avatar.path),
        ),
        AppDimens.medium.height,
        const Text(AppStrings.chooseProfileImage)
      ],
    );
  }
}
