import 'package:flutter/material.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/colors.dart';
import 'package:shopnew/screens/mainscreen/basket_screen.dart';
import 'package:shopnew/screens/mainscreen/profile_screen.dart';

import '../../res/strings.dart';
import '../../widgets/btm_nav_item.dart';
import 'home_screen.dart';

class BtmNavScreenIndex {
  BtmNavScreenIndex._();

  static const int home = 0;
  static const int basket = 1;
  // static const int cat = 2;
  static const int profile = 2;
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<int> _routeHistory = [BtmNavScreenIndex.home];
  int selectedindex = BtmNavScreenIndex.home;
  final GlobalKey<NavigatorState> _homeKey = GlobalKey();
  final GlobalKey<NavigatorState> _basketKey = GlobalKey();
  final GlobalKey<NavigatorState> _profileKey = GlobalKey();
  // final GlobalKey<NavigatorState> _catKey = GlobalKey();

  Map<int, GlobalKey<NavigatorState>> map = {};

  @override
  void initState() {
    super.initState();
    map = {
      BtmNavScreenIndex.home: _homeKey,
      BtmNavScreenIndex.basket: _basketKey,
      BtmNavScreenIndex.profile: _profileKey,
      // BtmNavScreenIndex.cat: _catKey,
    };
  }

  Future<bool> _onWillPop() async {
    if (map[selectedindex]!.currentState!.canPop()) {
      map[selectedindex]!.currentState!.pop();
    } else if (_routeHistory.length > 1) {
      setState(() {
        _routeHistory.removeLast();
        selectedindex = _routeHistory.last;
      });
    }

    return false;
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
                index: selectedindex,
                children: [
                  Navigator(
                    key: _homeKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  ),
                  Navigator(
                    key: _basketKey,
                    onGenerateRoute: (settings) => MaterialPageRoute(
                      builder: (context) => const BasketScreen(),
                    ),
                  ),
                  // Navigator(
                  //   key: _catKey,
                  //   onGenerateRoute: (settings) => MaterialPageRoute(
                  //     builder: (context) => const CategoryScreen(),
                  //   ),
                  // ),
                  Navigator(
                    key: _profileKey,
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
                    BtmNavItem(
                      svgAssets: Assets.svg.user,
                      labelText: AppStrings.profile,
                      ontap: () =>
                          btmNavOnPressed(index: BtmNavScreenIndex.profile),
                      isActive: selectedindex == BtmNavScreenIndex.profile,
                    ),
                    // BtmNavItem(
                    //   svgAssets: Assets.svg.category,
                    //   labelText: AppStrings.category,
                    //   ontap: () =>
                    //       btmNavOnPressed(index: BtmNavScreenIndex.cat),
                    //   isActive: selectedindex == BtmNavScreenIndex.cat,
                    // ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  btmNavOnPressed({required int index}) {
    setState(() {
      selectedindex = index;
      _routeHistory.add(selectedindex);
    });
  }
}
