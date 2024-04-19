import 'package:flutter/material.dart';

import '../component/text_style.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("لیست محصولات", style: LightAppTextStyle.title),
    ));
  }
}
