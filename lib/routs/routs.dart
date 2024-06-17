import 'package:flutter/material.dart';
import 'package:shopnew/routs/names.dart';
import 'package:shopnew/screens/auth/register/register_screen.dart';
import 'package:shopnew/screens/auth/send_sms_screen.dart';

import '../screens/auth/verify_code_screen.dart';
import '../screens/mainscreen/main_screen.dart';
import '../screens/product_list_screen.dart';
import '../screens/product_single_screen.dart';

Map<String, Widget Function(BuildContext)> routs = {
  ScreenNames.sendSmsScreen: (context) => SendSmsScreen(),
  ScreenNames.verifyCodeScreen: (context) => const VerifyCodeScreen(),
  ScreenNames.registerScreen: (context) => const RegisterScreen(),
  ScreenNames.mainScreen: (context) => const MainScreen(),
  ScreenNames.productSingleScreen: (context) => const ProductSingleScreen(),
  ScreenNames.productListScreen: (context) => const ProductListScreen(),
};
