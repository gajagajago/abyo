import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/shop_app/product_item_grid_tile.dart';
import 'package:provider/provider.dart';
import '../../providers/products_list.dart';
import 'product_item.dart';

class ProductsListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 7/10
      ),
      itemBuilder: (context, int idx) => ChangeNotifierProvider(
        create: (_) => context.watch<ProductsList>().products[idx], // watch here
        child: ProductItemGridTile(),
      ),
      itemCount: context.watch<ProductsList>().products.length,
    );
  }
}
