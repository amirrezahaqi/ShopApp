import 'package:dio/dio.dart';
import 'package:shopnew/data/constants.dart';
import 'package:shopnew/data/model/cart.dart';
import 'package:shopnew/utils/responce_validator.dart';

abstract class ICartDataSrc {
  Future<UserCart> getUserCart();
  Future<UserCart> addToCart({required int productId});
  Future<UserCart> removeFromCart({required int productId});
  Future<UserCart> deletFromCart({required int productId});
  Future<int> countCartItems();
}

class CartRemoteDataSrc implements ICartDataSrc {
  final Dio httpClient;
  static const productIdJsonKey = 'product_id';
  CartRemoteDataSrc(this.httpClient);

  @override
  Future<UserCart> addToCart({required int productId}) async =>
      await httpClient.post(Endpoints.addToCart,
          data: {productIdJsonKey: productId}).then((value) {
        HTTpResponceValidator.isValidStatusCode(value.statusCode ?? 0);

        return UserCart.fromJson(value.data['data']);
      });
  @override
  Future<UserCart> deletFromCart({required int productId}) async =>
      await httpClient.post(Endpoints.deleteFromCart,
          data: {productIdJsonKey: productId}).then((value) async {
        HTTpResponceValidator.isValidStatusCode(value.statusCode ?? 0);

        return UserCart.fromJson(value.data['data']);
      });
  @override
  Future<UserCart> removeFromCart({required int productId}) async =>
      await httpClient.post(Endpoints.removeFromCart,
          data: {productIdJsonKey: productId}).then((value) {
        HTTpResponceValidator.isValidStatusCode(value.statusCode ?? 0);

        return UserCart.fromJson(value.data['data']);
      });

  @override
  Future<UserCart> getUserCart() async {
    final responce = await httpClient.post(Endpoints.userCart);
    HTTpResponceValidator.isValidStatusCode(responce.statusCode ?? 0);
    return UserCart.fromJson(responce.data['data']);
  }

  @override
  Future<int> countCartItems() async {
    final responce = await httpClient.post(Endpoints.userCart);
    HTTpResponceValidator.isValidStatusCode(responce.statusCode ?? 0);
    return (responce.data["data"]['user_cart'] as List).length;
  }
}
