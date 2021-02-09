import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/shop_app/product_item_screen.dart';
import 'screens/home/root.dart';
import 'screens/home/home.dart';
import 'screens/home/auth.dart';
import 'screens/user_auth/sign_up.dart';
import 'screens/user_auth/sign_in.dart';
import 'screens/asset_app/asset_app.dart';
import 'screens/meals_app/meals_app.dart';
import 'screens/shop_app/shop_app.dart';
import 'screens/shop_app/product_item_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Root(),
        '/home': (context) => Home(),
        '/auth': (context) => Auth(),
        '/sign_up': (context) => SignUp(),
        '/sign_in': (context) => SignIn(),
        '/asset': (context) => AssetApp(),
        '/meals': (context) => MealsApp(),
        '/shop': (context) => ShopApp(),
        // '/product_item': (context) => ProductItemScreen(product: (ModalRoute.of(context).settings.arguments as Map)['product']),
      },
    );
  }
}
