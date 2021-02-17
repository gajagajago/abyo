import 'package:flutter/material.dart';
import '../screens/asset_app/asset_app.dart';
import '../screens/meals_app/meals_app.dart';
import '../screens/shop_app/shop_app.dart';
import '../screens/my_page/my_page.dart';

class HomeProvider with ChangeNotifier {
  int _idx = 0;

  final List<Map<String, dynamic>> appBarItems = [
    {
      'title': '자산관리',
      'leadingIcon': null,
      'trailingIcon': null,
    },
    {
      'title': '식단관리',
      'leadingIcon': null,
      'trailingIcon': null,
    },
    {
      'title': '쇼핑',
      'leadingIcon': null,
      'trailingIcon': IconButton(
        icon: Icon(Icons.favorite_outline),
        color: Colors.black54,
        iconSize: 30,
        onPressed: () {
          // Provider.of<ProductsList>(context, listen: false).toggleFavoriteFilter();
        },
      ),
    },
    {
      'title': '프로필',
      'leadingIcon': null,
      'trailingIcon': null,
    }
  ];

  final List<Widget> bodyItems = [
    AssetApp(),
    MealsApp(),
    ShopApp(),
    MyPage()
  ];

  final List<Map<String, dynamic>> bottomNavItems = [
    {
      'label': '자산',
      'icon': Icons.attach_money,
    },
    {
      'label': '식단',
      'icon': Icons.restaurant,
    },
    {
      'label': '쇼핑',
      'icon': Icons.shopping_bag,
    },
    {
      'label': '프로필',
      'icon': Icons.account_circle,
    },
  ];

  get idx => _idx;

  set idx(val) {
    _idx = val;
    notifyListeners();
  }

  Map<String, dynamic> get appBarItem => appBarItems[_idx];
  Widget get bodyItem => bodyItems[_idx];
  Map<String, dynamic> get bottomNavItem => bottomNavItems[_idx];
}
