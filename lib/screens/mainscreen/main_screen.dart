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
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = BtmNavScreenIndex.home;
  late List<GlobalKey<NavigatorState>> _navigatorKeys;

  @override
  void initState() {
    super.initState();
    _navigatorKeys = List.generate(4, (_) => GlobalKey<NavigatorState>());
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double btmNavHeight = size.height * .1;
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: btmNavHeight,
              child: IndexedStack(
                index: selectedIndex,
                children: [
                  Navigator(
                    key: _navigatorKeys[BtmNavScreenIndex.home],
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  ),
                  Navigator(
                    key: _navigatorKeys[BtmNavScreenIndex.basket],
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const BasketScreen(),
                    ),
                  ),
                  Navigator(
                    key: _navigatorKeys[BtmNavScreenIndex.cat],
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const CategoryScreen(),
                    ),
                  ),
                  Navigator(
                    key: _navigatorKeys[BtmNavScreenIndex.profile],
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const ProfileScreen(),
                    ),
                  ),
                ],
              ),
            ),
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
                    _buildNavItem(
                      svgAssets: Assets.svg.user,
                      labelText: AppStrings.profile,
                      index: BtmNavScreenIndex.profile,
                    ),
                    _buildNavItem(
                      svgAssets: Assets.svg.category,
                      labelText: AppStrings.category,
                      index: BtmNavScreenIndex.cat,
                    ),
                    _buildNavItem(
                      svgAssets: Assets.svg.basket,
                      labelText: AppStrings.basket,
                      index: BtmNavScreenIndex.basket,
                    ),
                    _buildNavItem(
                      svgAssets: Assets.svg.home,
                      labelText: AppStrings.home,
                      index: BtmNavScreenIndex.home,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String svgAssets,
    required String labelText,
    required int index,
  }) {
    return BtmNavItem(
      svgAssets: svgAssets,
      labelText: labelText,
      ontap: () => btmNavOnPressed(index: index),
      isActive: selectedIndex == index,
    );
  }

  void btmNavOnPressed({required int index}) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<bool> _onWillPop() async {
    if (_navigatorKeys[selectedIndex].currentState!.canPop()) {
      _navigatorKeys[selectedIndex].currentState!.pop();
    }
    return false;
  }
}
