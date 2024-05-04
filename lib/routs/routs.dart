import 'package:flutter/material.dart';
import 'package:shopnew/routs/names.dart';
import 'package:shopnew/screens/register_screen.dart';
import 'package:shopnew/screens/send_otp_screen.dart';

import '../screens/get_otp_screens.dart';
import '../screens/mainscreen/main_screen.dart';
import '../screens/product_list_screen.dart';
import '../screens/product_single_screen.dart';

Map<String, Widget Function(BuildContext)> routs = {
  ScreenNames.root: (context) => SendOtpScreen(),
  ScreenNames.getOtpScreen: (context) => GetOtpScreen(),
  ScreenNames.registerScreen: (context) => RegisterScreen(),
  ScreenNames.mainScreen: (context) => const MainScreen(),
  ScreenNames.productSingleScreen: (context) => const ProductSingleScreen(),
  ScreenNames.productListScreen: (context) => const ProductListScreen(),
};
