import 'package:flutter/material.dart';
import '../../commons/app_bar.dart';
import '../asset_app/asset_app.dart';
import '../meals_app/meals_app.dart';
import '../shop_app/shop_app.dart';
import '../my_page/my_page.dart';
import 'package:provider/provider.dart';
import '../../providers/products_list.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currIndex = 0;
  final List<Widget> bottomNavigationItems = [AssetApp(), MealsApp(), ShopApp(), MyPage()];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> appBarAttributes = [
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

    return MaterialApp(
      home: Scaffold(
        appBar: appBar(
            title: appBarAttributes[_currIndex]['title'],
            leadingIcon: appBarAttributes[_currIndex]['leadingIcon'],
            trailingIcon: appBarAttributes[_currIndex]['trailingIcon']
        ),
        body: bottomNavigationItems[_currIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) => {
            setState(() {
              _currIndex = index;
            })
          },
          currentIndex: _currIndex,
          items: [
            const BottomNavigationBarItem(
              label: '자산',
              icon: Icon(Icons.attach_money),
            ),
            const BottomNavigationBarItem(
              label: '식단',
              icon: Icon(Icons.restaurant),
            ),
            const BottomNavigationBarItem(
              label: '쇼핑',
              icon: Icon(Icons.shopping_bag),
            ),
            const BottomNavigationBarItem(
              label: '프로필',
              icon: Icon(Icons.account_circle),
            )
          ],
        ),
      ),
    );
  }
}
