import 'package:flutter/material.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/colors.dart';
import 'package:shopnew/screens/mainscreen/basket_screen.dart';
import 'package:shopnew/screens/mainscreen/category_screen.dart';
import 'package:shopnew/screens/mainscreen/profile_screen.dart';

import '../../res/strings.dart';
import '../../widgets/btm_nav_item.dart';
import 'home_screen.dart';

class BtmNavScreenIndex {
  BtmNavScreenIndex._();

  static const int home = 0;
  static const int basket = 1;
  static const int cat = 2;
  static const int profile = 3;
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedindex = BtmNavScreenIndex.home;

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
              child: IndexedStack(
                index: selectedindex,
                children: const [
                  HomeScreen(),
                  BasketScreen(),
                  CategoryScreen(),
                  ProfileScreen()
                ],
              )),
          Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: btmNavHeight,
                color: AppColors.scaffoldBackgroundColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BtmNavItem(
                      svgAssets: Assets.svg.user,
                      labelText: AppStrings.profile,
                      ontap: () =>
                          btmNavOnPressed(index: BtmNavScreenIndex.profile),
                      isActive: selectedindex == BtmNavScreenIndex.profile,
                    ),
                    BtmNavItem(
                      svgAssets: Assets.svg.category,
                      labelText: AppStrings.category,
                      ontap: () =>
                          btmNavOnPressed(index: BtmNavScreenIndex.cat),
                      isActive: selectedindex == BtmNavScreenIndex.cat,
                    ),
                    BtmNavItem(
                      svgAssets: Assets.svg.basket,
                      labelText: AppStrings.basket,
                      ontap: () =>
                          btmNavOnPressed(index: BtmNavScreenIndex.basket),
                      isActive: selectedindex == BtmNavScreenIndex.basket,
                    ),
                    BtmNavItem(
                      svgAssets: Assets.svg.home,
                      labelText: AppStrings.home,
                      ontap: () =>
                          btmNavOnPressed(index: BtmNavScreenIndex.home),
                      isActive: selectedindex == BtmNavScreenIndex.home,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  btmNavOnPressed({required index}) {
    setState(() {
      selectedindex = index;
    });
  }
}
