import 'package:flutter/material.dart';
import '../../commons/extract_arguments_screen.dart';
import 'product_item_screen.dart';
import 'product_item.dart';
import 'package:provider/provider.dart';
import '../../providers/shop_app/product.dart';
import '../../commons/app_bar.dart';
import 'product_item_screen_app_bar_trailing.dart';
import '../../providers/shop_app/cart_provider.dart';

class ProductItemGridTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Product product = context.read<Product>();
    final cartProvider = context.read<CartProvider>();

    return GridTile(
      child: GestureDetector(
        child: ProductItem(),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: product),
                ChangeNotifierProvider.value(value: cartProvider),
              ],
              child: ExtractArgumentsScreen(
                appBar: appBar(
                  title: '제품 상세',
                  trailing: ProductItemScreenAppBarTrailing(),
                ),
                body: ProductItemScreen(),
              )
            )
          )
        )
      ),
    );
  }
}
