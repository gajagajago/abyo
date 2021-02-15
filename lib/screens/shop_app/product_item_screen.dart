import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/product.dart';
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
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight * 2 - MediaQuery.of(context).padding.vertical;

    return ChangeNotifierProvider(
      create: (_) => Product(),
      child: Container(
        height: bodyHeight,
        child: SingleChildScrollView(
          child: ProductItem(),
        )
      )
    );
    return Container(
      height: bodyHeight,
      child: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (_) => Product(),
          child: ProductItem(),
        )
      ),
    );
  }
}
