import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/data/repo/home_repo.dart';
import 'package:shopnew/res/colors.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/res/strings.dart';
import 'package:shopnew/screens/home/bloc/home_bloc.dart';

import '../../widgets/app_slider.dart';
import '../../widgets/cat_widget.dart';
import '../../widgets/product_item.dart';
import '../../widgets/searchbar_widget.dart';
import '../../widgets/vertical_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) {
        final homeBloc = HomeBloc(homeRepository);
        homeBloc.add(HomeInit() as HomeEvent);
        return homeBloc;
      },
      child: Scaffold(
        body: SafeArea(child: SingleChildScrollView(
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              if (state is HomeLoading) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 400),
                    child: CircularProgressIndicator(),
                  ),
                );
              } else if (state is HomeLoaded) {
                return Column(
                  children: [
                    SearchBarWidget(
                      ontap: () {},
                    ),
                    AppSlider(
                      imgList: state.home.sliders,
                    ),
                    AppDimens.medium.height,
                    SizedBox(
                      height: size.height / 7,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: state.home.categories.length,
                          shrinkWrap: true,
                          itemBuilder: (c, i) {
                            return Padding(
                              padding: const EdgeInsets.all(7),
                              child: CatWidget(
                                  iconPath: state.home.categories[i].image,
                                  ontap: () {
                                    // ignore: avoid_print
                                    print("id:${state.home.categories[i].id}");
                                  },
                                  colors: i.isEven
                                      ? AppColors.catDesktopColors
                                      : AppColors.focusedBorderColor,
                                  label: state.home.categories[i].title),
                            );
                          }),
                    ),
                    AppDimens.medium.height,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: SizedBox(
                        height: size.height * .50,
                        child: Row(
                          children: [
                            AppDimens.large.height,
                            ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.home.amazingProduct.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  ProductItem(
                                image: state.home.amazingProduct[index].image,
                                productName:
                                    state.home.amazingProduct[index].title,
                                price: state.home.amazingProduct[index].price,
                                discount:
                                    state.home.amazingProduct[index].discount,
                                specialExpiration: state.home
                                    .amazingProduct[index].specialExpiration,
                                oldPrice: state
                                    .home.amazingProduct[index].discountPrice,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(AppDimens.large),
                              child: VerticalText(
                                title: AppStrings.topSells,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppDimens.large.height,
                  ],
                );
              } else if (state is HomeError) {
                return const Center(
                  child: Text("error"),
                );
              } else {
                throw Exception("invalid state");
              }
            },
          ),
        )),
      ),
    );
  }
}
