import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnew/component/text_style.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/strings.dart';
import 'package:shopnew/routs/names.dart';
import 'package:shopnew/screens/auth/cubit/auth_cubit.dart';

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
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is SentState) {
                  Navigator.pushNamed(context, ScreenNames.verifyCodeScreen,
                      arguments: state.mobile);
                } else if (state is ErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      duration: Duration(milliseconds: 800),
                      content: Text(
                        AppStrings.errorSnackBar,
                        style: LightAppTextStyle.button,
                      )));
                }
              },
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return MainButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context)
                        .sendSms(_controller.text);
                  },
                  text: AppStrings.next,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
