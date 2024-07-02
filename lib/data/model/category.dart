class Category {
  int id;
  String title;
  String image;

  Category({
    required this.id,
    required this.title,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        id: json['id'] as int,
        title: json['title'] as String,
        image: json['image'] as String);
  }
}
