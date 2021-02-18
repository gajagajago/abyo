import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/products_list.dart';
import '../../providers/authenticate.dart';
import 'products_list_grid.dart';
import '../../commons/app_bar.dart';
import 'shop_app_app_bar_trailing.dart';

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight * 2 - MediaQuery.of(context).padding.vertical;

    return ChangeNotifierProvider(
      create: (_) => ProductsList(authToken: context.read<Authenticate>().authToken),
      lazy: false,
      child: Scaffold(
        appBar: appBar(
          title: '쇼핑',
          trailing: ShopAppAppBarTrailing(),
        ),
        body: Container(
          height: bodyHeight,
          child: ProductsListGrid(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.shopping_cart),
          onPressed: null,
        ),
      )
    );
  }
}
