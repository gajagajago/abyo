import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../models/product.dart';
import '../../helpers/helper_function.dart';
import 'product_item_screen.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({this.product});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductItemScreen(product: product)
          )
        ),
        child: Column(
          children: [
            Image.network(product.imageUrl),
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
        ),
      ),
    );
  }
}
