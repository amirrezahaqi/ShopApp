import 'package:flutter/material.dart';
import 'package:shopnew/routs/names.dart';
import 'package:shopnew/screens/register_screen.dart';
import 'package:shopnew/screens/send_otp_screen.dart';

import '../screens/get_otp_screens.dart';
import '../screens/mainscreen/main_screen.dart';
import '../screens/product_list_screen.dart';
import '../screens/product_single_screen.dart';

Map<String, Widget Function(BuildContext)> routs = {
  ScreeNames.root: (context) => SendOtpScreen(),
  ScreeNames.getOtpScreen: (context) => GetOtpScreen(),
  ScreeNames.registerScreen: (context) => RegisterScreen(),
  ScreeNames.mainScreen: (context) => const MainScreen(),
  ScreeNames.productSingleScreen: (context) => const ProductSingleScreen(),
  ScreeNames.productListScreen: (context) => const ProductListScreen(),
};
