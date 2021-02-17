import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/home_provider.dart';
import '../../commons/app_bar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();

    return Scaffold(
      appBar: appBar(homeProvider.appBarItem),
      body: homeProvider.bodyItem,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (idx) => homeProvider.idx = idx,
        currentIndex: homeProvider.idx,
        items: homeProvider.bottomNavItems.map((e) =>
            BottomNavigationBarItem(
              label: e['label'],
              icon: Icon(e['icon']),
            )
        ).toList(),
      ),
    );
  }
}
