import 'dart:async';

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

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _controller = TextEditingController();
  @override
  initState() {
    super.initState();
    startTimer();
  }

  late Timer _timer;
  int _start = 120;

  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _timer.cancel();
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.red,
              duration: Duration(milliseconds: 800),
              content: Text(
                AppStrings.errorSendVerifyCode,
                style: LightAppTextStyle.button,
              )));
        } else {
          _start--;
        }
      });
    });
  }

  String formatTime(int sec) {
    int min = sec ~/ 60;
    int seconds = sec % 60;

    String minStr = min.toString().padLeft(2, "0");
    String secondsStr = seconds.toString().padLeft(2, "0");
    return "$minStr:$secondsStr";
  }

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
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Text(AppStrings.wrongNumberEditNumber,
                  style: LightAppTextStyle.falsenumber),
            ),
            AppTextField(
              hint: AppStrings.hintPhoneNumber,
              controller: _controller,
              label: AppStrings.enterYourNumber,
              prefix: formatTime(_start),
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                _timer.cancel();
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
