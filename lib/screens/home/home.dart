import 'package:flutter/material.dart';
import '../../commons/app_bar.dart';
import '../asset_app/asset_app.dart';
import '../meals_app/meals_app.dart';
import '../my_page/my_page.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currIndex = 0;
  List<Widget> bottomNavigationItems = [AssetApp(), MealsApp(), MyPage()];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          BottomNavigationBarItem(
            label: '자산관리',
            icon: Icon(Icons.attach_money),
          ),
          BottomNavigationBarItem(
            label: '식단',
            icon: Icon(Icons.restaurant),
          ),
          BottomNavigationBarItem(
            label: '프로필',
            icon: Icon(Icons.account_circle),
          )
        ],
      ),
    );
  }
}
