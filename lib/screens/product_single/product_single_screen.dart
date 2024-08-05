import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/data/repo/product_repo.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/colors.dart';
import 'package:shopnew/screens/product_single/bloc/product_single_bloc.dart';
import 'package:shopnew/widgets/app_bar.dart';
import 'package:shopnew/widgets/cart_bridge.dart';
import 'package:shopnew/widgets/main_button.dart';

import '../../component/text_style.dart';
import '../../res/dimens.dart';

class ProductSingleScreen extends StatelessWidget {
  final id;
  const ProductSingleScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) {
        final productBloc = ProductSingleBloc(productRepository);
        productBloc.add(ProductSingleInit(id: id));
        return productBloc;
      },
      child: BlocConsumer<ProductSingleBloc, ProductSingleState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ProductSingleLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ProductSingleLoaded) {
            return SafeArea(
              child: Scaffold(
                  appBar: CustomAppBar(
                      child: Padding(
                    padding: const EdgeInsets.all(AppDimens.medium),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CartBadge(count: 2),
                        Row(
                          children: [
                            Text(
                              state.productDetails.title ?? "خطایی رخ داده است",
                              style: LightAppTextStyle.title,
                            ),
                            AppDimens.medium.width,
                            SvgPicture.asset(Assets.svg.close),
                          ],
                        )
                      ],
                    ),
                  )),
                  body: Stack(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(),
                              child: Image.asset(
                                fit: BoxFit.cover,
                                Assets.png.unnamed.path,
                              ),
                            ),
                            AppDimens.medium.height,
                            Container(
                              width: size.width * .99,
                              decoration: const BoxDecoration(
                                  color: AppColors.btmNavColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(AppDimens.large))),
                              child: Padding(
                                padding: const EdgeInsets.all(AppDimens.large),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      "ساعت مچی مردانه",
                                      style: LightAppTextStyle.title,
                                    ),
                                    const Text(
                                      "توضیحات محصول مورد نظر",
                                      style: LightAppTextStyle.hint,
                                    ),
                                    const Divider(),
                                    AppDimens.medium.height,
                                    const ProductTabView(),
                                    AppDimens.large.height,
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Container(
                          color: AppColors.appbar,
                          height: 70,
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "تومان",
                                              style: LightAppTextStyle.title
                                                  .copyWith(),
                                            ),
                                            Text(
                                              100000.seprateWithComma,
                                              style: LightAppTextStyle.title
                                                  .copyWith(),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "تومان ",
                                              style: LightAppTextStyle.title
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: AppColors.hint),
                                            ),
                                            Text(
                                              120000.seprateWithComma,
                                              style: LightAppTextStyle.title
                                                  .copyWith(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: AppColors.hint),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(
                                          AppDimens.small * .5),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(
                                              AppDimens.small)),
                                      child: const Text(
                                        "20%",
                                        style: LightAppTextStyle.button,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: size.width * .5,
                                  child: MainButton(
                                    text: "افزودن به سبد خرید",
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            );
          } else if (state is ProductSingleError) {
            return const Text("error");
          } else {
            throw Exception("invalid");
          }
        },
      ),
    );
  }
}

class ProductTabView extends StatefulWidget {
  const ProductTabView({super.key});

  @override
  State<ProductTabView> createState() => _ProductTabViewState();
}

class _ProductTabViewState extends State<ProductTabView> {
  var selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: size.width,
          height: AppDimens.large * 2,
          child: ListView.builder(
              itemCount: tabs.length,
              itemExtent: size.width / tabs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.all(AppDimens.medium),
                      child: Text(
                        tabs[index],
                        style: selectedIndex == index
                            ? LightAppTextStyle.title
                            : LightAppTextStyle.hint,
                      ),
                    ),
                  )),
        ),
        IndexedStack(
          index: selectedIndex,
          children: const [Review(), Comments(), Fetures()],
        )
      ],
    );
  }
}

List<String> tabs = ["بررسی", "نظرات", "مشخصات"];

class Review extends StatelessWidget {
  const Review({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
        """بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسبررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسبررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسبررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسبررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی بررسی """);
  }
}

class Comments extends StatelessWidget {
  const Comments({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
        """نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات نظرات """);
  }
}

class Fetures extends StatelessWidget {
  const Fetures({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
        """مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات مشخصات """);
  }
}
