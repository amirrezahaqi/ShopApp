import 'package:flutter/material.dart';

import 'component/themes.dart';
import 'routs/names.dart';
import 'routs/routs.dart';

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
      // home: const HomeScreen(),
      initialRoute: ScreenNames.root,
      routes: routs,
    );
  }
}
