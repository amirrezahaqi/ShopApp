import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopnew/component/extension.dart';
import 'package:shopnew/data/repo/cart_repo.dart';
import 'package:shopnew/data/repo/product_repo.dart';
import 'package:shopnew/res/dimens.dart';
import 'package:shopnew/screens/product_list/bloc/product_list_bloc.dart';
import 'package:shopnew/widgets/product_item.dart';

import '../../component/text_style.dart';
import '../../gen/assets.gen.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/cart_bridge.dart';
import '../../widgets/cart_tags.dart';

class ProductListScreen extends StatelessWidget {
  final param;
  const ProductListScreen({super.key, this.param});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final productListBloc = ProductListBloc(productRepository);
        productListBloc.add(ProductListInit(param: param));

        return productListBloc;
      },
      child: SafeArea(
        child: Scaffold(
            appBar: CustomAppBar(
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.medium),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ValueListenableBuilder(
                        valueListenable: cartRepository.cartCount,
                        builder: (context, value, widget) {
                          return CartBadge(count: value);
                        }),
                    Row(
                      children: [
                        const Text("پروفروش ترین محصولات",
                            style: LightAppTextStyle.title),
                        AppDimens.small.width,
                        SvgPicture.asset(Assets.svg.sort),
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(Assets.svg.close))
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                AppDimens.medium.height,
                const CatTags(),
                AppDimens.medium.height,
                BlocBuilder<ProductListBloc, ProductListState>(
                  builder: (context, state) {
                    if (state is ProductListLoading) {
                      return const CircularProgressIndicator();
                    } else if (state is ProductListLoaded) {
                      return Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: .5,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 2),
                            itemCount: state.productList.length,
                            itemBuilder: (context, i) {
                              return ProductItem(product: state.productList[i]);
                            }),
                      );
                    } else if (state is ProductListError) {
                      return const Text("error");
                    } else {
                      throw Exception("invalid state");
                    }
                  },
                ),
              ],
            )),
      ),
    );
  }
}
