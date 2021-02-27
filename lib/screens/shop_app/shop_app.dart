import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/shop_app/products_list.dart';
import '../../providers/shop_app/cart_provider.dart';
import '../../providers/user_auth/authenticate.dart';
import '../../commons/app_bar.dart';
import 'shop_app_app_bar_trailing.dart';
import 'shop_app_body.dart';
import 'shop_app_floating.dart';

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsList(authToken: context.read<Authenticate>().authToken)),
        ChangeNotifierProvider(create: (_) => CartProvider(authToken: context.read<Authenticate>().authToken)),
      ],
      child: ShopAppScaffold()
    );
  }
}

class ShopAppScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: '쇼핑',
        trailing: ShopAppAppBarTrailing(),
      ),
      body: ShopAppBody(),
      floatingActionButton: ShopAppFloating(),
    );
  }
}
