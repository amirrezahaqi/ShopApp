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
import 'package:shopnew/widgets/main_button.dart';

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
                          return CartList(list: state.cartList);
                        } else if (state is CartItemAddedState) {
                          return CartList(list: state.cartList);
                        } else if (state is CartItemDeleteState) {
                          return CartList(list: state.cartList);
                        } else if (state is CartItemRemovedState) {
                          return CartList(list: state.cartList);
                        } else if (state is CartErrorState) {
                          return const Text(
                            "خطایی رخ داده است",
                            style: LightAppTextStyle.title,
                          );
                        } else if (state is CartLoadingState) {
                          return const LinearProgressIndicator();
                        } else {
                          return ElevatedButton(
                            onPressed: () {
                              BlocProvider.of<CartBloc>(context)
                                  .add(CartInitEvent());
                            },
                            child: const Text(
                              "تلاش مجدد",
                              style: LightAppTextStyle.title,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                AppDimens.large2x.height,
                AppDimens.large2x.height,
              ],
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "تومان",
                                    style: LightAppTextStyle.title.copyWith(),
                                  ),
                                  Text(
                                    100000.seprateWithComma,
                                    style: LightAppTextStyle.title.copyWith(),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "تومان ",
                                    style: LightAppTextStyle.title.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      color: AppColors.hint,
                                    ),
                                  ),
                                  Text(
                                    120000.seprateWithComma,
                                    style: LightAppTextStyle.title.copyWith(
                                      decoration: TextDecoration.lineThrough,
                                      color: AppColors.hint,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.all(AppDimens.small * .5),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.circular(AppDimens.small),
                            ),
                            child: const Text(
                              "20%",
                              style: LightAppTextStyle.button,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * .3,
                        child: MainButton(
                          text: "ادامه خرید",
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
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
        final cartBloc = BlocProvider.of<CartBloc>(context);
        return Padding(
          padding: const EdgeInsets.all(AppDimens.medium),
          child: ShopingCartItem(
            productTitle: list[index].product,
            count: list[index].count,
            add: () => cartBloc.add(AddToCartEvent(list[index].productId)),
            remove: () =>
                cartBloc.add(RemoveFromCartEvent(list[index].productId)),
            delete: () =>
                cartBloc.add(DeleteFromCartEvent(list[index].productId)),
          ),
        );
      },
    );
  }
}
