import 'package:flutter/material.dart';
import 'package:shopnew/routs/names.dart';
import 'package:shopnew/routs/routs.dart';

import 'component/themes.dart';

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
      initialRoute: ScreeNames.root,
      routes: routs,
    );
  }
}
