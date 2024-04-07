import 'package:flutter/material.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/res/strings.dart';

import '../widgets/app_text_field.dart';
import '../widgets/avatar.dart';
import '../widgets/main_button.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Avatar(),
              AppDimens.medium.height,
              AppTextField(
                hint: AppStrings.hintNameLastName,
                controller: _controller,
                label: AppStrings.nameLastName,
              ),
              AppTextField(
                hint: AppStrings.hintHomeNumber,
                controller: _controller,
                label: AppStrings.homeNumber,
              ),
              AppTextField(
                hint: AppStrings.hintAddress,
                controller: _controller,
                label: AppStrings.address,
              ),
              AppTextField(
                hint: AppStrings.hintPostalCode,
                controller: _controller,
                label: AppStrings.postalCode,
              ),
              AppTextField(
                hint: AppStrings.hintLocation,
                controller: _controller,
                label: AppStrings.location,
                icon: const Icon(Icons.location_on),
              ),
              MainButton(
                onPressed: () {},
                text: AppStrings.next,
              ),
              AppDimens.medium.height,
            ],
          ),
        ),
      ),
    );
  }
}
