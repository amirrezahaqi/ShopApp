import 'package:dio/dio.dart';
import 'package:shopnew/data/model/product.dart';
import 'package:shopnew/data/model/product_details.dart';
import 'package:shopnew/data/src/product_data_src.dart';

abstract class IProductRepository {
  Future<ProductDetails> getProductDetails(int id);
  Future<List<Product>> getAllByCategory(int id);
  Future<List<Product>> getAllByBrand(int id);
  Future<List<Product>> getStored(String routeParam);
  Future<List<Product>> searchProducts(String searchKey);
}

class ProductRepository implements IProductRepository {
  final IProductDataSrc _iProductDataSrc;

  ProductRepository(this._iProductDataSrc);

  @override
  Future<List<Product>> getAllByBrand(int id) =>
      _iProductDataSrc.getAllByBrand(id);

  @override
  Future<List<Product>> getAllByCategory(int id) =>
      _iProductDataSrc.getAllByCategory(id);

  @override
  Future<List<Product>> getStored(String routeParam) =>
      _iProductDataSrc.getStored(routeParam);

  @override
  Future<List<Product>> searchProducts(String searchKey) =>
      _iProductDataSrc.searchProducts(searchKey);

  @override
  Future<ProductDetails> getProductDetails(int id) =>
      _iProductDataSrc.getProductDetails(id);
}

final productRepository = ProductRepository(ProductRemoteDataSrc(Dio()));
