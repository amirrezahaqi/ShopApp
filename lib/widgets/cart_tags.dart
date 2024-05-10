import 'package:flutter/material.dart';

import '../component/text_style.dart';
import '../res/colors.dart';
import '../res/dimens.dart';

class CatTags extends StatelessWidget {
  const CatTags({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.medium),
      child: SizedBox(
        height: 24,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, i) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.small),
                margin: const EdgeInsets.symmetric(horizontal: AppDimens.small),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(AppDimens.large)),
                child: const Text(
                  "نیوفورس",
                  style: LightAppTextStyle.button,
                ),
              );
            }),
      ),
    );
  }
}
