import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/shop_app/cart_provider.dart';
import 'cart_items_list_tile.dart';
import '../../providers/shop_app/cart_item.dart';

class CartItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<CartItem> cartItems = context.read<CartProvider>().cartItems;
    double boxHeight = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight * 2 -
        MediaQuery.of(context).padding.vertical - 40; //temp 40

    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(height: boxHeight),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int idx) => ChangeNotifierProvider.value(
          value: cartItems[idx],
          child: CartItemsListTile(),
        ),
        itemCount: cartItems.length,
      )
    );
  }
}
