import 'package:flutter/material.dart';
import 'package:shopnew/res/colors.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double btmNavHeight = size.height * .1;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            bottom: btmNavHeight,
            child: Container(
              color: AppColors.primaryColor,
            ),
          ),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: btmNavHeight,
                color: AppColors.scaffoldBackgroundColor,
              ))
        ],
      ),
    );
  }
}
