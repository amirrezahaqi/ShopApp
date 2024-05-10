import 'package:flutter/material.dart';
import 'package:shopnew/screens/product_single_screen.dart';

import 'component/themes.dart';
import 'routs/names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sky Line",
      theme: lightTheme(),
      home: const ProductSingleScreen(),
      initialRoute: ScreenNames.root,
      // routes: routs,
    );
  }
}
