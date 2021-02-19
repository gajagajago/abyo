import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/products_list.dart';
import '../../providers/authenticate.dart';
import '../../commons/app_bar.dart';
import 'shop_app_app_bar_trailing.dart';
import 'shop_app_body.dart';

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
          onPressed: null,
        ),
      )
    );
  }
}
