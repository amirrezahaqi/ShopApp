import 'package:shopnew/data/model/banner.dart';
import 'package:shopnew/data/model/category.dart';
import 'package:shopnew/data/model/product.dart';
import 'package:shopnew/data/model/slide.dart';

class Home {
  List<Slide> sliders;
  List<Category> categories;
  List<Product> amazingProduct;
  List<Product> mostSellerProduct;
  List<Product> newstProduct;
  Banner banner;

  Home({
    required this.sliders,
    required this.amazingProduct,
    required this.banner,
    required this.categories,
    required this.mostSellerProduct,
    required this.newstProduct,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      sliders: (json['sliders'] as List<dynamic>)
          .map((e) => Slide.fromJson(e))
          .toList(),
      amazingProduct: (json['amazing_products'] as List<dynamic>)
          .map((e) => Product.fromJson(e))
          .toList(),
      banner: Banner.fromJson(json['banner']),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e))
          .toList(),
      mostSellerProduct: (json['most_seller_products'] as List<dynamic>)
          .map((e) => Product.fromJson(e))
          .toList(),
      newstProduct: (json['newest_products'] as List<dynamic>)
          .map((e) => Product.fromJson(e))
          .toList(),
    );
  }
}
