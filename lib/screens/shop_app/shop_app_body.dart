import 'package:flutter/material.dart';
import 'products_list_grid.dart';

class ShopAppBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight * 2 - MediaQuery.of(context).padding.vertical;

    return Container(
      height: bodyHeight,
      child: ProductsListGrid(),
    );
  }
}
