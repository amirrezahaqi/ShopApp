import 'package:flutter/material.dart';
import 'package:shopnew/routs/names.dart';
import 'package:shopnew/screens/register_screen.dart';
import 'package:shopnew/screens/send_otp_screen.dart';

import '../screens/get_otp_screens.dart';

Map<String, Widget Function(BuildContext)> routs = {
  ScreeNames.root: (context) => SendOtpScreen(),
  ScreeNames.getOtpScreen: (context) => GetOtpScreen(),
  ScreeNames.registerScreen: (context) => RegisterScreen(),
};
