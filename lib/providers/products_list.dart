import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product.dart';

class ProductsList with ChangeNotifier {
  List<Product> _products;
  bool loading = false;
  bool _favoriteFilter = false;

  ProductsList({@required String authToken}) {
    fetchProductsList(authToken);
  }

  List<Product> get products => _favoriteFilter ? favoriteProducts : _products;
  List<Product> get favoriteProducts => _products.where((p) => p.isFavorite).toList();

  Future fetchProductsList(String authToken) async {
    try {
      loading = true;
      String url = Platform.isAndroid
          ? 'http://10.0.2.2:3000/api/v1/products'
          : 'http://127.0.0.1:3000/api/v1/products';

      final response = await http.get(
          url,
          headers: {'Content-Type': "application/json", 'AUTH-TOKEN': authToken}
        );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = json.decode(response.body);
        _products = jsonList.map((e) => Product.fromJson(e)).toList();
        loading = false;
      }
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }

  void toggleFavoriteFilter() {
    _favoriteFilter = !_favoriteFilter;
    notifyListeners();
  }
}
