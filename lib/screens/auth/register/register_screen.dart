import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/res/strings.dart';
import 'package:shopnew/routs/names.dart';
import 'package:shopnew/utils/image_handler.dart';

import '../../../widgets/app_text_field.dart';
import '../../../widgets/avatar.dart';
import '../../../widgets/main_button.dart';
import '../../../widgets/registration_appbar.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _controller = TextEditingController();

  ImageHandler imageHandler = ImageHandler();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: RegistrationAppBar(size: size),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Avatar(
                  ontap: () async => await imageHandler
                      .pickAndCroppImage(source: ImageSource.gallery)
                      .then((value) => setState(() {})),
                  file: imageHandler.getImage,
                ),
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
                  icon: const Icon(Icons.add_location_alt_outlined),
                ),
                AppDimens.medium.height,
                MainButton(
                  onPressed: () =>
                      Navigator.pushNamed(context, ScreenNames.mainScreen),
                  text: AppStrings.next,
                ),
                AppDimens.medium.height,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
