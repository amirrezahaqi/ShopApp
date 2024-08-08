import 'package:shopnew/data/conf/remote_conf.dart';
import 'package:shopnew/data/model/cart.dart';
import 'package:shopnew/data/src/cart_data_src.dart';

abstract class ICartRepository {
  Future<List<CartModel>> getUserCart();
  Future<void> addToCart({required int productId});
  Future<void> removeFromCart({required int productId});
  Future<void> deletFromCart({required int productId});
}

class CartRepo implements ICartRepository {
  final ICartDataSrc _cartDataSrc;

  CartRepo(this._cartDataSrc);

  @override
  Future<void> addToCart({required int productId}) =>
      _cartDataSrc.addToCart(productId: productId);

  @override
  Future<void> deletFromCart({required int productId}) =>
      _cartDataSrc.deletFromCart(productId: productId);

  @override
  Future<List<CartModel>> getUserCart() => _cartDataSrc.getUserCart();

  @override
  Future<void> removeFromCart({required int productId}) =>
      _cartDataSrc.removeFromCart(productId: productId);
}

final cartRepository = CartRepo(CartRemoteDataSrc(DioManager.dio));
