import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/products_list.dart';
import '../../providers/authenticate.dart';
import 'products_list_grid.dart';

class ShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight * 2 - MediaQuery.of(context).padding.vertical;

    return ChangeNotifierProvider(
      create: (_) => ProductsList(authToken: context.read<Authenticate>().authToken),
      lazy: false,
      child: Scaffold(
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
