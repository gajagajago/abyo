import 'package:flutter/material.dart';
import 'package:flutter_quiz/providers/shop_app/cart_provider.dart';
import '../../commons/extract_arguments_screen.dart';
import '../../commons/app_bar.dart';
import 'cart_screen.dart';
import 'package:provider/provider.dart';

class ShopAppFloating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();

    return FloatingActionButton(
      child: Icon(Icons.shopping_cart),
      onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider.value(
              value: cartProvider,
              child: ExtractArgumentsScreen(
                  appBar: appBar(title: '장바구니'),
                  body: CartScreen()
              ),
            )
          )
      ),
    );
  }
}
