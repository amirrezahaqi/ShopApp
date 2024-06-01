import 'package:flutter/material.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/strings.dart';
import 'package:shopnew/routs/names.dart';

import '../../widgets/app_text_field.dart';
import '../../widgets/main_button.dart';

class SendSmsScreen extends StatelessWidget {
  SendSmsScreen({super.key});
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
            AppTextField(
              hint: AppStrings.hintPhoneNumber,
              controller: _controller,
              label: AppStrings.enterYourNumber,
            ),
            MainButton(
              onPressed: () =>
                  Navigator.pushNamed(context, ScreenNames.verifyCodeScreen),
              text: AppStrings.next,
            ),
          ],
        ),
      ),
    );
  }
}
