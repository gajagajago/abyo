import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  int _appBarIdx = 0;
  int _bottomNavIdx = 0;

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

  get bottomNavIdx => _bottomNavIdx;

  set appBarIdx(val) {
    _appBarIdx = val;
    notifyListeners();
  }

  set bottomNavIdx(val) {
    _bottomNavIdx = val;
    _appBarIdx = val; // app bar is always in sync with bottom nav
    notifyListeners();
  }

  Map<String, dynamic> get appBarItem => appBarItems[_appBarIdx];
  Map<String, dynamic> get bottomNavItem => bottomNavItems[_bottomNavIdx];
}
