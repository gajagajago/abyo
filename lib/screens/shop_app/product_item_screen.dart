import 'package:flutter/material.dart';
import '../../models/product.dart';
import '../../helpers/helper_function.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductItemScreen extends StatefulWidget {
  final Product product;

  ProductItemScreen({this.product});

  @override
  State<StatefulWidget> createState() {
    return _ProductItemScreenState();
  }
}

class _ProductItemScreenState extends State<ProductItemScreen> {
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight * 2 - MediaQuery.of(context).padding.vertical;

    return Container(
      height: bodyHeight,
      child: SingleChildScrollView(
        child: Column(
          children: [
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
                      widget.product.title,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                  Text(
                    HelperFunction().moneyFormatter(currency: 'krw', amount: widget.product.price),
                    style: TextStyle(
                      fontSize: 16,
                      color: HexColor("#AE0000"),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Image.network(widget.product.imageUrl),
          ],
        ),
      ),
    );

  }
}
