import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/text_style.dart';
import 'package:shopnew/data/model/cart.dart';
import 'package:shopnew/gen/assets.gen.dart';
import 'package:shopnew/res/colors.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/screens/cart/bloc/cart_bloc.dart';

class ShopingCartItem extends StatefulWidget {
  ShopingCartItem({
    super.key,
    required this.cartModel,
  });

  CartModel cartModel;

  @override
  State<ShopingCartItem> createState() => _ShopingCartItemState();
}

class _ShopingCartItemState extends State<ShopingCartItem> {
  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.borderColor, width: .5),
          color: AppColors.btmNavColor,
          borderRadius:
              const BorderRadius.all(Radius.circular(AppDimens.medium))),
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.medium * 1.5),
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.right,
              widget.cartModel.product,
              textDirection: TextDirection.rtl,
              style: LightAppTextStyle.title,
            ),
            // Text(
            //   "قیمت : $price تومان",
            //   style: LightAppTextStyle.hint,
            //   overflow: TextOverflow.clip,
            // ),
            // Text(
            //   "با تخفیف : $oldPrice تومان",
            //   style: LightAppTextStyle.falsenumber,
            //   overflow: TextOverflow.clip,
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {});
                      return cartBloc
                          .add(DeleteFromCartEvent(widget.cartModel.productId));
                    },
                    icon: SvgPicture.asset(
                      Assets.svg.delete,
                      colorFilter: const ColorFilter.mode(
                          AppColors.red, BlendMode.srcIn),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() => widget.cartModel.countLoading = true);
                        return cartBloc
                            .add(AddToCartEvent(widget.cartModel.productId));
                      },
                      icon: SvgPicture.asset(
                        Assets.svg.plus,
                        colorFilter: const ColorFilter.mode(
                            AppColors.borderColor, BlendMode.srcIn),
                      ),
                    ),
                    widget.cartModel.countLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            " ${widget.cartModel.count} عدد",
                            textDirection: TextDirection.rtl,
                            style: LightAppTextStyle.title,
                          ),
                    IconButton(
                        onPressed: () {
                          setState(() => widget.cartModel.countLoading = true);
                          return cartBloc.add(
                              RemoveFromCartEvent(widget.cartModel.productId));
                        },
                        icon: SvgPicture.asset(
                          Assets.svg.minus,
                          colorFilter: const ColorFilter.mode(
                              AppColors.borderColor, BlendMode.srcIn),
                        ))
                  ],
                ),
              ],
            ),
            Visibility(
                visible: widget.cartModel.deleteLoading,
                child: const LinearProgressIndicator())
          ],
        ),
      ),
    );
  }
}
