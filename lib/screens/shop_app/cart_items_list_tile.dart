import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/shop_app/cart_item.dart';
import '../../helpers/helper_function.dart';

class CartItemsListTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartItem = context.read<CartItem>();

    return Container(
      width: double.infinity,
      height: 120,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Image.network(cartItem.product.imageUrl),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${cartItem.product.title}, ${cartItem.productCount}개",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  Text(HelperFunction().moneyFormatter(currency: 'krw', amount: cartItem.product.price)),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
