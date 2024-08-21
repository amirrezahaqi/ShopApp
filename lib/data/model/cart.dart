class CartModel {
  int id;
  int productId;
  String product;
  int count;
  int price;
  int discountprice;
  int discount;
  String image;
  bool countLoading = false;
  bool deleteLoading = false;
  CartModel({
    required this.id,
    required this.productId,
    required this.product,
    this.countLoading = false,
    this.deleteLoading = false,
    required this.count,
    required this.price,
    required this.discountprice,
    required this.discount,
    required this.image,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        id: json['id'],
        productId: json['product_id'],
        product: json['product'],
        count: json['count'],
        price: json['price'],
        discountprice: json['discount_price'],
        discount: json['discount'],
        image: json['image']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['product'] = product;
    data['price'] = price;
    data['discount_price'] = discountprice;
    data['discount'] = discount;
    data['image'] = image;
    return data;
  }
}

class UserCart {
  List<CartModel> cartList;
  int cartTotalPrice;
  int totalWithoutDiscount;
  UserCart({
    required this.cartList,
    required this.cartTotalPrice,
    required this.totalWithoutDiscount,
  });

  factory UserCart.fromJson(Map<String, dynamic> json) {
    List<dynamic> userCArtJson = json['user_cart'];
    List<CartModel> cartList =
        userCArtJson.map((e) => CartModel.fromJson(e)).toList();
    return UserCart(
      cartList: cartList,
      cartTotalPrice: json['cart_total_price'],
      totalWithoutDiscount: json['total_without_dicount_price'],
    );
  }
}
