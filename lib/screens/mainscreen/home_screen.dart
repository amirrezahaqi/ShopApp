import 'package:flutter/material.dart';

import '../../res/colors.dart';
import '../../widgets/searchbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: const Center(
        child: SearchBarWidget(),
      ),
    );
  }
}
