import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/authenticate.dart';
import '../../providers/home_provider.dart';
import '../user_auth/auth.dart';
import 'home.dart';

class Root extends StatelessWidget {
  // int _currIndex = 0;
  // final List<Widget> bottomNavigationItems = [AssetApp(), MealsApp(), ShopApp(), MyPage()];

  @override
  Widget build(BuildContext context) {
    final auth = context.read<Authenticate>();
    auth.initAuthToken();

    if (auth.authToken == null || auth.authToken == '') {
      return Auth();
    } else {
      return ChangeNotifierProvider(
        create: (_) => HomeProvider(),
        child: Home(),
      );
    }

    // final List<Map<String, dynamic>> appBarAttributes = [
    //   {
    //     'title': '자산관리',
    //     'leadingIcon': null,
    //     'trailingIcon': null,
    //   },
    //   {
    //     'title': '식단관리',
    //     'leadingIcon': null,
    //     'trailingIcon': null,
    //   },
    //   {
    //     'title': '쇼핑',
    //     'leadingIcon': null,
    //     'trailingIcon': IconButton(
    //       icon: Icon(Icons.favorite_outline),
    //       color: Colors.black54,
    //       iconSize: 30,
    //       onPressed: () {
    //         // Provider.of<ProductsList>(context, listen: false).toggleFavoriteFilter();
    //       },
    //     ),
    //   },
    //   {
    //     'title': '프로필',
    //     'leadingIcon': null,
    //     'trailingIcon': null,
    //   }
    // ];

    // return Scaffold(
    //   appBar: appBar(
    //       title: appBarAttributes[_currIndex]['title'],
    //       leadingIcon: appBarAttributes[_currIndex]['leadingIcon'],
    //       trailingIcon: appBarAttributes[_currIndex]['trailingIcon']
    //   ),
    //   body: bottomNavigationItems[_currIndex],
    //   bottomNavigationBar: BottomNavigationBar(
    //     type: BottomNavigationBarType.fixed,
    //     onTap: (index) => {
    //       setState(() {
    //         _currIndex = index;
    //       })
    //     },
    //     currentIndex: _currIndex,
    //     items: [
    //       const BottomNavigationBarItem(
    //         label: '자산',
    //         icon: Icon(Icons.attach_money),
    //       ),
    //       const BottomNavigationBarItem(
    //         label: '식단',
    //         icon: Icon(Icons.restaurant),
    //       ),
    //       const BottomNavigationBarItem(
    //         label: '쇼핑',
    //         icon: Icon(Icons.shopping_bag),
    //       ),
    //       const BottomNavigationBarItem(
    //         label: '프로필',
    //         icon: Icon(Icons.account_circle),
    //       )
    //     ],
    //   ),
    // );
  }
}
