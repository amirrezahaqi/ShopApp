import 'package:flutter/material.dart';

import '../../widgets/app_slider.dart';
import '../../widgets/searchbar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(
              ontap: () {},
            ),
            AppSlider()
          ],
        ),
      )),
    );
  }
}
