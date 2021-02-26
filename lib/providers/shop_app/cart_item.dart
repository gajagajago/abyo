import 'package:flutter/material.dart';
import 'product.dart';
import 'package:flutter/foundation.dart';

class CartItem with ChangeNotifier {
  Product product;
  int productCount;

  CartItem({@required this.product, @required this.productCount});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product']),
      productCount: json['product_count'],
    );
  }
}
