import 'package:flutter/material.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/res/strings.dart';

import '../component/text_style.dart';
import '../gen/assets.gen.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.ontap, required this.file});

  final ontap;
  final file;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          SizedBox(
            width: size.width * .3,
            height: size.width * .3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: file == null
                  ? Image.asset(
                      Assets.png.avatar.path,
                      width: size.width * .3,
                    )
                  : Image.file(file),
            ),
          ),
          AppDimens.medium.height,
          const Text(
            AppStrings.chooseProfileImage,
            style: LightAppTextStyle.title,
          )
        ],
      ),
    );
  }
}
