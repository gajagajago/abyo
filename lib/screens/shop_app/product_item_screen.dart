import 'package:flutter/material.dart';
import 'product_item.dart';
import 'package:provider/provider.dart';
import '../../providers/shop_app/cart_provider.dart';
import '../../providers/user_auth/authenticate.dart';
import '../../providers/shop_app/product.dart';

class ProductItemScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductItemScreenState();
  }
}

class _ProductItemScreenState extends State<ProductItemScreen> {
  int productCount = 1;

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.read<CartProvider>();
    final authToken = context.read<Authenticate>().authToken;
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight - MediaQuery.of(context).padding.vertical;

    return Container(
      color: Colors.white,
      height: bodyHeight,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductItem(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 52,
                    maxWidth: 122,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.fromBorderSide(
                            BorderSide(
                              color: Colors.grey,
                              // width: 1,
                              style: BorderStyle.solid,
                            )
                        )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 80,
                          child: Center(
                            child: Text(
                              productCount.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            RaisedButton(
                              color: Colors.white,
                              child: Icon(Icons.keyboard_arrow_up),
                              onPressed: () {
                                setState(() {
                                  productCount ++;
                                });
                              },
                            ),
                            RaisedButton(
                              color: Colors.white,
                              child: Container(
                                  width: 40,
                                  height: 25,
                                  child: Icon(Icons.keyboard_arrow_down)
                              ),
                              onPressed: () {
                                setState(() {
                                  productCount ++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ),
              )
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
                      height: double.infinity,
                      width: (MediaQuery.of(context).size.width - 30) / 2,
                      child: RaisedButton(
                        color: Colors.white,
                        child: Text(
                          '장바구니 담기',
                          style: TextStyle(color: Colors.blue),
                        ),
                        onPressed: () => cartProvider.createCartItem(
                            authToken: authToken,
                            params: {
                              'product_id': context.read<Product>().id,
                              'product_count': productCount,
                            },
                        ).then((value) => cartProvider.fetchCartItems(authToken))
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      width: (MediaQuery.of(context).size.width - 30) / 2,
                      child: RaisedButton(
                        color: Colors.blue,
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
