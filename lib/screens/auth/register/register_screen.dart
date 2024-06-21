import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/data/model/user.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/res/strings.dart';
import 'package:shopnew/routs/names.dart';
import 'package:shopnew/screens/auth/register/cubit/register_cubit.dart';
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
  final TextEditingController _controllerNameLastName = TextEditingController();
  final TextEditingController _controllerHomeNumber = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  final TextEditingController _controllerPostalCode = TextEditingController();
  final TextEditingController _controllerLocation = TextEditingController();
  double lat = 0.0;
  double lng = 0.0;
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
            child: BlocProvider(
              create: (context) => RegisterCubit(),
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
                    controller: _controllerNameLastName,
                    label: AppStrings.nameLastName,
                  ),
                  AppTextField(
                    hint: AppStrings.hintHomeNumber,
                    controller: _controllerHomeNumber,
                    label: AppStrings.homeNumber,
                  ),
                  AppTextField(
                    hint: AppStrings.hintAddress,
                    controller: _controllerAddress,
                    label: AppStrings.address,
                  ),
                  AppTextField(
                    hint: AppStrings.hintPostalCode,
                    controller: _controllerPostalCode,
                    label: AppStrings.postalCode,
                  ),
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is LocationPickedState) {
                        if (state.location != null) {
                          _controllerLocation.text =
                              '${state.location!.latitude} - ${state.location!.longitude}';
                          lat = state.location!.latitude;
                          lng = state.location!.longitude;
                        }
                      }
                    },
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<RegisterCubit>(context)
                              .pickTheLocation(context: context);
                        },
                        child: AppTextField(
                          hint: AppStrings.hintLocation,
                          controller: _controllerLocation,
                          label: AppStrings.location,
                          icon: const Icon(Icons.add_location_alt_outlined),
                        ),
                      );
                    },
                  ),
                  AppDimens.medium.height,
                  BlocConsumer<RegisterCubit, RegisterState>(
                    listener: (context, state) {
                      if (state is OkResponceState) {
                        Navigator.pushNamed(context, ScreenNames.mainScreen);
                      } else if (state is ErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text(AppStrings.errorSnackBar)));
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return MainButton(
                          onPressed: () async {
                            User user = User(
                                name: _controllerNameLastName.text,
                                phone: _controllerHomeNumber.text,
                                address: _controllerAddress.text,
                                postalCode: _controllerPostalCode.text,
                                image: await MultipartFile.fromFile(
                                    imageHandler.getImage!.path),
                                lat: lat,
                                lng: lng);
                            BlocProvider.of<RegisterCubit>(context)
                                .register(user: user);
                          },
                          text: AppStrings.next,
                        );
                      }
                    },
                  ),
                  AppDimens.medium.height,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
