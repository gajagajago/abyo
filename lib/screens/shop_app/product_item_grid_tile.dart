import 'package:flutter/material.dart';
import '../home/extract_arguments_screen.dart';
import 'product_item_screen.dart';
import 'product_item.dart';

class ProductItemGridTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        child: ProductItem(),
        onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => ExtractArgumentsScreen(
                    appBarTitle: '제품상세',
                    body: ProductItemScreen()
                )
            )
        )
      ),
    );
  }
}
