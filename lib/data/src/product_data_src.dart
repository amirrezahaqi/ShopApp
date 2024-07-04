import 'package:dio/dio.dart';
import 'package:shopnew/data/constants.dart';
import 'package:shopnew/data/model/product.dart';
import 'package:shopnew/utils/responce_validator.dart';

abstract class IProductDataSrc {
  Future<List<Product>> getAllByCategory(int id);
  Future<List<Product>> getAllByBrand(int id);
  Future<List<Product>> getStored(String routeParam);
  Future<List<Product>> searchProducts(String searchKey);
}

class ProductRemoteDataSrc implements IProductDataSrc {
  final Dio httpClient;

  ProductRemoteDataSrc(this.httpClient);

  @override
  Future<List<Product>> getAllByBrand(int id) async {
    List<Product> products = <Product>[];
    final response =
        await httpClient.get(Endpoints.productsByBrand + id.toString());
    HTTpResponceValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<Product>> getAllByCategory(int id) async {
    List<Product> products = <Product>[];
    final response =
        await httpClient.get(Endpoints.productsByCategory + id.toString());
    HTTpResponceValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<Product>> getStored(String routeParam) async {
    List<Product> products = <Product>[];
    final response = await httpClient.get(Endpoints.baseUrl + routeParam);
    HTTpResponceValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<Product>> searchProducts(String searchKey) async {
    List<Product> products = <Product>[];
    final response = await httpClient.get(Endpoints.baseUrl + searchKey);
    HTTpResponceValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in (response.data['all_products']['data'] as List)) {
      products.add(Product.fromJson(element));
    }
    return products;
  }
}
