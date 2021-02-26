import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../providers/shop_app/product.dart';
import '../../helpers/helper_function.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = context.watch<Product>();

    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(product.imageUrl),
              Positioned(
                child: IconButton(
                  icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_outline),
                  color: product.isFavorite ? Colors.red : Colors.black54,
                  iconSize: 40,
                  onPressed: () {
                    product.toggleIsFavorite();
                  },
                ),
                bottom: 8,
                right: 8,
              )
            ],
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text(
                    product.title,
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Text(
                  HelperFunction().moneyFormatter(currency: 'krw', amount: product.price),
                  style: TextStyle(
                    fontSize: 16,
                    color: HexColor("#AE0000"),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      )
    );
  }
}
