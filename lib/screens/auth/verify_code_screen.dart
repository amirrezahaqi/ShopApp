import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/res/strings.dart';
import 'package:shopnew/screens/auth/cubit/auth_cubit.dart';

import '../../component/text_style.dart';
import '../../routs/names.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/main_button.dart';

class VerifyCodeScreen extends StatelessWidget {
  VerifyCodeScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mobileRouteArg = ModalRoute.of(context)!.settings.arguments as String;
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
                  mobileRouteArg,
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
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is VerifiedIsNotRegisteredState) {
                  Navigator.pushNamed(context, ScreenNames.registerScreen);
                } else if (state is VerifiedIsRegisteredState) {
                  Navigator.pushNamed(context, ScreenNames.mainScreen);
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return MainButton(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context)
                          .verifyCode(mobileRouteArg, _controller.text);
                    },
                    text: AppStrings.next,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
