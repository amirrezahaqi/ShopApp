import 'package:flutter/foundation.dart';
import 'package:shopnew/data/conf/remote_conf.dart';
import 'package:shopnew/data/model/cart.dart';
import 'package:shopnew/data/src/cart_data_src.dart';

abstract class ICartRepository {
  Future<List<CartModel>> getUserCart();
  Future<int> addToCart({required int productId});
  Future<void> removeFromCart({required int productId});
  Future<int> deletFromCart({required int productId});
  Future<int> countCartItems();
}

class CartRepo implements ICartRepository {
  final ICartDataSrc _cartDataSrc;
  ValueNotifier<int> cartCount = ValueNotifier(0);
  CartRepo(this._cartDataSrc);

  @override
  Future<int> addToCart({required int productId}) => _cartDataSrc
      .addToCart(productId: productId)
      .then((value) => cartCount.value = value);

  @override
  Future<int> deletFromCart({required int productId}) => _cartDataSrc
      .deletFromCart(productId: productId)
      .then((value) => cartCount.value = value);

  @override
  Future<List<CartModel>> getUserCart() => _cartDataSrc.getUserCart();

  @override
  Future<void> removeFromCart({required int productId}) =>
      _cartDataSrc.removeFromCart(productId: productId);

  @override
  Future<int> countCartItems() =>
      _cartDataSrc.countCartItems().then((value) => cartCount.value = value);
}

final cartRepository = CartRepo(CartRemoteDataSrc(DioManager.dio));
