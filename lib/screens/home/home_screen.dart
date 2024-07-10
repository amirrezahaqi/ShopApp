import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/data/repo/home_repo.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/colors.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/res/strings.dart';
import 'package:shopnew/screens/home/bloc/home_bloc.dart';

import '../../widgets/app_slider.dart';
import '../../widgets/cat_widget.dart';
import '../../widgets/product_box.dart';
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
                  child: CircularProgressIndicator(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CatWidget(
                          iconPath: Assets.svg.clasic,
                          ontap: () {},
                          colors: AppColors.catClasicColors,
                          label: AppStrings.classic,
                        ),
                        CatWidget(
                          iconPath: Assets.svg.smart,
                          ontap: () {},
                          colors: AppColors.catDesktopColors,
                          label: AppStrings.desktop,
                        ),
                        CatWidget(
                          iconPath: Assets.svg.clasic,
                          ontap: () {},
                          colors: AppColors.catDigitalColors,
                          label: AppStrings.digital,
                        ),
                        CatWidget(
                          iconPath: Assets.svg.smart,
                          ontap: () {},
                          colors: AppColors.catSmartColors,
                          label: AppStrings.smart,
                        ),
                      ],
                    ),
                    AppDimens.medium.height,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: SizedBox(
                        height: size.height * .38,
                        child: Row(
                          children: [
                            AppDimens.large.height,
                            ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 8,
                              itemBuilder: (BuildContext context, int index) =>
                                  const ProductBoxWidget(
                                productName: "ساعت مچی مردانه و زنانه",
                                price: 100,
                                discount: 20,
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
                    AppSlider(
                      imgList: state.home.sliders,
                    ),
                    AppDimens.medium.height,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: SizedBox(
                        height: size.height * .38,
                        child: Row(
                          children: [
                            AppDimens.large.height,
                            ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: 8,
                              itemBuilder: (BuildContext context, int index) =>
                                  const ProductBoxWidget(
                                productName: "ساعت مچی مردانه و زنانه",
                                price: 100,
                                discount: 20,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(AppDimens.large),
                              child: VerticalText(
                                title: AppStrings.newestProduct,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AppDimens.large.height,
                    AppSlider(
                      imgList: state.home.sliders,
                    ),
                    AppDimens.medium.height,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      reverse: true,
                      child: SizedBox(
                        height: size.height * .38,
                        child: Row(
                          children: [
                            AppDimens.large.height,
                            ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: state.home.amazingProduct.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  ProductBoxWidget(
                                productName:
                                    state.home.amazingProduct[index].title,
                                price: state.home.amazingProduct[index].price,
                                discount:
                                    state.home.amazingProduct[index].discount,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(AppDimens.large),
                              child: VerticalText(
                                title: AppStrings.amazing,
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
