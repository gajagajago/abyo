import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'product.dart';
import '../../helpers/http_request.dart';

class ProductsList with ChangeNotifier {
  List<Product> _products;
  bool loading = false;
  bool _favoriteFilter = false;

  ProductsList({@required String authToken}) {
    fetchProductsList(authToken);
  }

  bool get favoriteFilter => _favoriteFilter;
  List<Product> get products => _favoriteFilter ? favoriteProducts : _products;
  List<Product> get favoriteProducts =>
      _products.where((p) => p.isFavorite).toList();

  Future fetchProductsList(String authToken) async {
    try {
      loading = true;
      await HttpRequest()
          .get(partialUrl: "products", authToken: authToken)
          .then((response) {
            if (response.statusCode == 200) {
              final List<dynamic> jsonList = json.decode(response.body);
              _products = jsonList.map((e) => Product.fromJson(e)).toList();
              loading = false;
            }
          });
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
