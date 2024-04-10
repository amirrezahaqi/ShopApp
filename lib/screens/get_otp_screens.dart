import 'package:flutter/material.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/res/strings.dart';

import '../component/text_style.dart';
import '../routs/names.dart';
import '../widgets/app_text_field.dart';
import '../widgets/main_button.dart';

class GetOtpScreen extends StatelessWidget {
  GetOtpScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Assets.png.mainLogo.image(),
            AppDimens.medium.height,
            Text(
                AppStrings.otpCodeSendFor.replaceAll(
                  AppStrings.replace,
                  "09123456789",
                ),
                style: LightAppTextStyle.title),
            AppDimens.medium.height,
            const Text(AppStrings.wrongNumberEditNumber,
                style: LightAppTextStyle.falsenumber),
            AppTextField(
              hint: AppStrings.hintPhoneNumber,
              controller: _controller,
              label: AppStrings.enterYourNumber,
              prefix: "20:20",
            ),
            MainButton(
              onPressed: () =>
                  Navigator.pushNamed(context, ScreeNames.registerScreen),
              text: AppStrings.next,
            ),
          ],
        ),
      ),
    );
  }
}
