import 'package:flutter/material.dart';

import '../component/text_style.dart';

class ProductSingleScreen extends StatelessWidget {
  const ProductSingleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("صفحه محصولات", style: LightAppTextStyle.title),
    ));
  }
}
