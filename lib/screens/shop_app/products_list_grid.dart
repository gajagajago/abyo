import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/shop_app/products_list.dart';
import 'product_item_grid_tile.dart';

class ProductsListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return context.watch<ProductsList>().loading
        ? Container(child: Center(child: CircularProgressIndicator()))
        : GridView.builder(
            padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 7 / 10),
            itemBuilder: (context, int idx) => ChangeNotifierProvider(
              create: (_) => context.read<ProductsList>().products[idx],
              child: ProductItemGridTile(),
            ),
            itemCount: context.read<ProductsList>().products.length,
          );
  }
}
