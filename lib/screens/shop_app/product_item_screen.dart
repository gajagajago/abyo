import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/shop_app/product.dart';
import 'product_item.dart';

class ProductItemScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductItemScreenState();
  }
}

class _ProductItemScreenState extends State<ProductItemScreen> {
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight - MediaQuery.of(context).padding.vertical;

    return Container(
      height: bodyHeight,
      child: Stack(
        children: [
          Column(
            children: [
              ProductItem(),
              Container(
                child: Text('수량'),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.white,
                      height: 60,
                      width: (MediaQuery.of(context).size.width - 30) / 2,
                      child: RaisedButton(
                        child: Text(
                          '장바구니 담기',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () {
                          print("Pressed add to cart");
                        },
                      ),
                    ),
                    Container(
                      color: Colors.blue,
                      height: 60,
                      width: (MediaQuery.of(context).size.width - 30) / 2,
                      child: RaisedButton(
                        child: Text(
                          '구매하기',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          print("Pressed order");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
