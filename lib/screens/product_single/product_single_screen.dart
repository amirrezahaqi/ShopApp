import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/data/model/product_details.dart';
import 'package:shopnew/data/repo/cart_repo.dart';
import 'package:shopnew/data/repo/product_repo.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/colors.dart';
import 'package:shopnew/screens/cart/bloc/cart_bloc.dart';
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final productBloc = ProductSingleBloc(productRepository);
            productBloc.add(ProductSingleInit(id: id));
            return productBloc;
          },
        ),
        BlocProvider(
          create: (context) => CartBloc(cartRepository),
        ),
      ],
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
                            FittedBox(
                              child: Text(
                                state.productDetails.title ??
                                    "خطایی رخ داده است",
                                style: LightAppTextStyle.title,
                                textAlign: TextAlign.right,
                              ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: SvgPicture.asset(Assets.svg.close),
                            )
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
                              child: Image.network(
                                  scale: 1,
                                  fit: BoxFit.cover,
                                  state.productDetails.image!),
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
                                    Text(
                                      state.productDetails.brand ?? "",
                                      style: LightAppTextStyle.title,
                                    ),
                                    Text(
                                      state.productDetails.title ?? "",
                                      style: LightAppTextStyle.hint,
                                    ),
                                    const Divider(),
                                    AppDimens.medium.height,
                                    ProductTabView(
                                        productDetails: state.productDetails),
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
                                              state
                                                  .productDetails
                                                  .discountPrice!
                                                  .seprateWithComma,
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
                                              state.productDetails.price!
                                                  .seprateWithComma,
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
                                          color: AppColors.red,
                                          borderRadius: BorderRadius.circular(
                                              AppDimens.small)),
                                      child: const Text(
                                        "20%",
                                        style: LightAppTextStyle.button,
                                      ),
                                    ),
                                  ],
                                ),
                                BlocConsumer<CartBloc, CartState>(
                                  listener: (cartContext, cartState) {
                                    if (cartState is CartItemAddedState) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              backgroundColor:
                                                  AppColors.success,
                                              content: Text(
                                                " محصول با موفقیت به سبد خرید اضافه شد ",
                                                style: LightAppTextStyle.title
                                                    .copyWith(
                                                        color: AppColors
                                                            .onSuccess),
                                              )));
                                    }
                                  },
                                  builder: (cartContext, cartState) {
                                    if (cartState is CartLoadingState) {
                                      return const Positioned(
                                          bottom: 0,
                                          left: AppDimens.large,
                                          right: AppDimens.large,
                                          child: LinearProgressIndicator());
                                    }
                                    return SizedBox(
                                      width: size.width * .5,
                                      child: MainButton(
                                        text: "افزودن به سبد خرید",
                                        onPressed: () {
                                          BlocProvider.of<CartBloc>(context)
                                              .add(AddToCartEvent(
                                                  state.productDetails.id!));
                                        },
                                      ),
                                    );
                                  },
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
  final ProductDetails productDetails;

  const ProductTabView({
    super.key,
    required this.productDetails,
  });

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
          children: [
            const Review(),
            CommentsList(
              comments: widget.productDetails.comments!,
            ),
            PropertyList(
              properties: widget.productDetails.properties!,
            )
          ],
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

class PropertyList extends StatelessWidget {
  final List<Properties> properties;
  const PropertyList({super.key, required this.properties});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: properties.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            color: AppColors.propertiesItem,
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        padding: const EdgeInsets.all(AppDimens.medium),
        margin: const EdgeInsets.all(AppDimens.medium),
        child: Text(
          "${properties[index].property!} : ${properties[index].value!}",
          textAlign: TextAlign.right,
          style: LightAppTextStyle.hint,
        ),
      ),
    );
  }
}

class CommentsList extends StatelessWidget {
  final List<Comments> comments;
  const CommentsList({super.key, required this.comments});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: comments.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => Container(
        decoration: BoxDecoration(
            color: AppColors.propertiesItem,
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        padding: const EdgeInsets.all(AppDimens.medium),
        margin: const EdgeInsets.all(AppDimens.medium),
        child: Text(
          "${comments[index].body!} : ${comments[index].user}",
          textAlign: TextAlign.right,
          style: LightAppTextStyle.hint,
        ),
      ),
    );
  }
}
