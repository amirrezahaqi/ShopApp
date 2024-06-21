import 'dart:convert';

class User {
  final String name;
  final String phone;
  final String address;
  final String postalCode;
  final image;
  final double lat;
  final double lng;
  User({
    required this.name,
    required this.phone,
    required this.address,
    required this.postalCode,
    required this.image,
    required this.lat,
    required this.lng,
  });
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'postal_code': postalCode,
      'lat': lat,
      'lng': lng,
      'image': image,
      'phone': phone,
    };
  }

  factory User.fromJson(String? jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString!);
    return User(
        name: map['name'],
        phone: map['phone'],
        address: map['address'],
        postalCode: map['postal_code'],
        image: map['image'],
        lat: map['lat'],
        lng: map['lng']);
  }
}
