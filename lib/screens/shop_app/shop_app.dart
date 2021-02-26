import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/shop_app/products_list.dart';
import '../../providers/user_auth/authenticate.dart';
import '../../commons/app_bar.dart';
import 'shop_app_app_bar_trailing.dart';
import 'shop_app_body.dart';
import 'cart_screen.dart';
import '../../commons/extract_arguments_screen.dart';

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductsList(authToken: context.read<Authenticate>().authToken),
      lazy: false,
      child: Scaffold(
        appBar: appBar(
          title: '쇼핑',
          trailing: ShopAppAppBarTrailing(),
        ),
        body: ShopAppBody(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart),
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ExtractArgumentsScreen(
                appBar: appBar(title: '장바구니'),
                body: CartScreen()
              ),
            )
          ),
        ),
      )
    );
  }
}
