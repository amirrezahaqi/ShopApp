import 'package:flutter/material.dart';
import 'package:shopnew/screens/product_list_screen.dart';

import '../../component/text_style.dart';
import '../../res/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const ProductListScreen())),
          child: const Text("مشاهده محصولات", style: LightAppTextStyle.title),
        ),
      ),
    );
  }
}
