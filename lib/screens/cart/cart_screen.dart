import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/data/model/cart.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/colors.dart';
import 'package:shopnew/res/strings.dart';
import 'package:shopnew/screens/cart/bloc/cart_bloc.dart';
import 'package:shopnew/widgets/app_bar.dart';
import 'package:shopnew/widgets/cart_bridge.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../component/text_style.dart';
import '../../res/dimens.dart';
import '../../widgets/shoping_cart_item.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartBloc>(context).add(CartInitEvent());
    var size = MediaQuery.of(context).size;
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
                    const Text(
                      AppStrings.basket,
                      style: LightAppTextStyle.title,
                    ),
                    AppDimens.medium.width,
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                AppDimens.large.height,
                Padding(
                  padding: const EdgeInsets.all(AppDimens.medium),
                  child: Container(
                    width: double.infinity,
                    height: size.height * .1,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: .5,
                      ),
                      color: AppColors.btmNavColor,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppDimens.medium),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimens.medium * 1.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(Assets.svg.leftArrow),
                          AppDimens.medium.width,
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "ارسال به آدرس",
                                  style: LightAppTextStyle.title,
                                ),
                                FittedBox(
                                  child: Text(
                                    AppStrings.lurem,
                                    style: LightAppTextStyle.hint,
                                    overflow: TextOverflow.clip,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoadedState) {
                          return CartList(list: state.userCart.cartList);
                        } else if (state is CartItemAddedState) {
                          return CartList(list: state.userCart.cartList);
                        } else if (state is CartItemDeleteState) {
                          return CartList(list: state.userCart.cartList);
                        } else if (state is CartItemRemovedState) {
                          return CartList(list: state.userCart.cartList);
                        } else if (state is CartErrorState) {
                          return const Text(
                            "خطایی رخ داده است",
                            style: LightAppTextStyle.title,
                          );
                        } else if (state is CartLoadingState) {
                          return const LinearProgressIndicator();
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ),
                AppDimens.large2x.height,
                AppDimens.large2x.height,
              ],
            ),
            BlocConsumer<CartBloc, CartState>(
              builder: (context, state) {
                UserCart? userCart;
                switch (state.runtimeType) {
                  case CartLoadedState:
                  case CartItemAddedState:
                  case CartItemDeleteState:
                  case CartItemRemovedState:
                    userCart = (state as dynamic).userCart;
                    break;
                  case CartErrorState:
                    return const Center(
                      child: Text(
                        "خطایی رخ داده است",
                        style: LightAppTextStyle.title,
                      ),
                    );
                  case CartLoadingState:
                    return const LinearProgressIndicator();
                  default:
                    return const SizedBox();
                }
                return Visibility(
                  visible: (userCart?.cartTotalPrice ?? 0) > 0,
                  child: Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Visibility(
                          visible: (userCart?.cartTotalPrice ?? 0) > 0,
                          child: GestureDetector(
                              onTap: () => BlocProvider.of<CartBloc>(context)
                                  .add(PayEvent()),
                              child: Container(
                                padding: const EdgeInsets.all(AppDimens.medium),
                                margin: const EdgeInsets.all(AppDimens.medium),
                                decoration: const BoxDecoration(
                                    color: AppColors.surfaceColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(AppDimens.small))),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(Assets.svg.leftArrow),
                                    Column(
                                      children: [
                                        Text(
                                          "باتخفیف: ${userCart?.cartTotalPrice.seprateWithComma}تومان",
                                          style:
                                              LightAppTextStyle.title.copyWith(
                                            color: AppColors.hint,
                                          ),
                                        ),
                                        Visibility(
                                          visible:
                                              userCart?.totalWithoutDiscount !=
                                                  userCart?.cartTotalPrice,
                                          child: Text(
                                            "قیمت: ${userCart?.totalWithoutDiscount.seprateWithComma}تومان",
                                            style: LightAppTextStyle.title
                                                .copyWith(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.red,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )))),
                );
              },
              listener: (context, state) async {
                if (state is RecivedPaymentState) {
                  final Uri url = Uri.parse(state.url);
                  if (!await launchUrl(url)) {
                    throw Exception("could not Lounch $url");
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  final List<CartModel> list;

  const CartList({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        // ignore: unused_local_variable
        final cartBloc = BlocProvider.of<CartBloc>(context);
        return Padding(
          padding: const EdgeInsets.all(AppDimens.medium),
          child: ShopingCartItem(
            cartModel: list[index],
          ),
        );
      },
    );
  }
}
