import 'package:dio/dio.dart';
import 'package:shopnew/data/constants.dart';
import 'package:shopnew/data/model/cart.dart';
import 'package:shopnew/utils/responce_validator.dart';

abstract class ICartDataSrc {
  Future<List<CartModel>> getUserCart();
  Future<List<CartModel>> addToCart({required int productId});
  Future<List<CartModel>> removeFromCart({required int productId});
  Future<List<CartModel>> deletFromCart({required int productId});

  countCartItems() {}
}

class CartRemoteDataSrc implements ICartDataSrc {
  final Dio httpClient;
  static const productIdJsonKey = 'product_id';
  CartRemoteDataSrc(this.httpClient);

  @override
  Future<List<CartModel>> addToCart({required int productId}) async =>
      await httpClient.post(Endpoints.addToCart,
          data: {productIdJsonKey: productId}).then((value) {
        List<CartModel> cartList = <CartModel>[];
        HTTpResponceValidator.isValidStatusCode(value.statusCode ?? 0);
        for (var e in (value.data['data']['user_cart'] as List)) {
          cartList.add(CartModel.fromJson(e));
        }
        return cartList;
      });
  @override
  Future<List<CartModel>> deletFromCart({required int productId}) async =>
      await httpClient.post(Endpoints.deleteFromCart,
          data: {productIdJsonKey: productId}).then((value) async {
        List<CartModel> cartList = <CartModel>[];
        HTTpResponceValidator.isValidStatusCode(value.statusCode ?? 0);
        for (var e in (value.data['data']['user_cart'] as List)) {
          cartList.add(CartModel.fromJson(e));
        }
        return cartList;
      });
  @override
  Future<List<CartModel>> removeFromCart({required int productId}) async =>
      await httpClient.post(Endpoints.removeFromCart,
          data: {productIdJsonKey: productId}).then((value) {
        List<CartModel> cartList = <CartModel>[];
        HTTpResponceValidator.isValidStatusCode(value.statusCode ?? 0);
        for (var e in (value.data['data']['user_cart'] as List)) {
          cartList.add(CartModel.fromJson(e));
        }
        return cartList;
      });

  @override
  Future<List<CartModel>> getUserCart() async {
    List<CartModel> cartList = <CartModel>[];
    final responce = await httpClient.post(Endpoints.userCart);
    HTTpResponceValidator.isValidStatusCode(responce.statusCode ?? 0);
    for (var e in (responce.data['data']['user_cart'] as List)) {
      cartList.add(CartModel.fromJson(e));
    }
    return cartList;
  }

  @override
  Future<int> countCartItems() async {
    final responce = await httpClient.post(Endpoints.userCart);
    HTTpResponceValidator.isValidStatusCode(responce.statusCode ?? 0);
    return (responce.data["data"]['user_cart'] as List).length;
  }
}
