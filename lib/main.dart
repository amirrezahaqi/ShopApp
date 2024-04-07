import 'package:flutter/material.dart';

import 'component/themes.dart';
import 'screens/register_screen.dart';

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
      home: SafeArea(child: RegisterScreen()),
    );
  }
}
