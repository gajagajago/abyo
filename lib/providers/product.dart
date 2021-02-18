import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final int id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['image_url'],
      isFavorite: json['is_favorite'],
    );
  }

  void toggleIsFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
