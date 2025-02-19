class Product {
  int id;
  String title;
  int price;
  int discount;
  String specialExpiration;
  int discountPrice;
  int productCount;
  String category;
  String brand;
  String image;

  Product({
    required this.brand,
    required this.category,
    required this.discount,
    required this.discountPrice,
    required this.id,
    required this.image,
    required this.price,
    required this.productCount,
    required this.specialExpiration,
    required this.title,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        brand: json['brand'],
        category: json['category'],
        discount: json['discount'],
        discountPrice: json['discount_price'],
        id: json['id'],
        image: json['image'],
        price: json['price'],
        productCount: json['product_count'],
        specialExpiration: json['special_expiration'],
        title: json['title']);
  }
}
