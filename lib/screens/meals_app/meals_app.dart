import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/shop_app/products_list.dart';
import '../../providers/user_auth/authenticate.dart';
import '../../commons/app_bar.dart';

class MealsApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MealsAppState();
  }
}

class _MealsAppState extends State<MealsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: '식단관리'),
      body: ChangeNotifierProvider(
        create: (_) => ProductsList(authToken: context.read<Authenticate>().authToken),
        lazy: false,
        child: MealsAppContents(),
      )
    );
  }
}

class MealsAppContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height -
        Scaffold.of(context).appBarMaxHeight -
        kBottomNavigationBarHeight -
        MediaQuery.of(context).padding.vertical;

    return Container(
      height: bodyHeight,
      child: !context.watch<ProductsList>().loading
          ? Column(
          children: context.watch<ProductsList>().products
              .map((e) => Text(e.title))
              .toList())
          : Container(
          child: Center(
            child: CircularProgressIndicator(),
          ))
    );
  }
}
