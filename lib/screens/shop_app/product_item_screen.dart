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
      height: bodyHeight,
      child: Stack(
        children: [
          Column(
            children: [
              ProductItem(),
              Container(
                child: Text('수량: $productCount'),
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
