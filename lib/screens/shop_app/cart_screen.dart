import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/shop_app/cart_provider.dart';
import 'cart_items.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = context.watch<CartProvider>();
    double bodyHeight = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight * 2 -
        MediaQuery.of(context).padding.vertical;

    return SingleChildScrollView(
        child: Container(
            height: bodyHeight,
            child: cartProvider.loading
                ? Center(child: CircularProgressIndicator())
                : Column(
                  children: [
                    CartItems(),
                    Container(
                      width: double.infinity,
                      color: Colors.white38,
                      height: 40,
                    )
                  ])
        )
    );
  }
}
