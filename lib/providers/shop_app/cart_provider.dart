import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../providers/shop_app/cart_item.dart';
import '../../helpers/http_request.dart';
import 'cart_item.dart';
import 'dart:convert';

class CartProvider with ChangeNotifier {
  int _cartId;
  List<CartItem> _cartItems;
  bool loading = false;

  CartProvider({@required String authToken}) {
    fetchCartItems(authToken);
  }

  get cartId => _cartId;
  get cartItems => _cartItems;

  Future fetchCartItems(String authToken) async {
    try {
      loading = true;
      await HttpRequest()
          .get(partialUrl: 'carts', authToken: authToken)
          .then((response) {
            final res = json.decode(response.body);
            final List<dynamic> jsonList = res['cart_items'];

            _cartId = res['id'];
            _cartItems = jsonList.map((e) => CartItem.fromJson(e)).toList();

            loading = false;
      });
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }

  Future createCartItem({@required String authToken, @required Map<String, int> params}) async {
    try {
      await HttpRequest().post(
        partialUrl: "carts/$cartId/cart_items",
        authToken: authToken,
        body: params
      ).then((response) {
        if (response.statusCode == 200) {
          final res = json.decode(response.body);
          print(res['msg']);
          return response;
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
