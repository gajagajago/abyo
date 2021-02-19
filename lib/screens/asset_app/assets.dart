import 'package:flutter/material.dart';
import 'package:flutter_quiz/providers/assets_provider.dart';
import 'asset.dart';
// import '../../providers/asset.dart';
import 'package:provider/provider.dart';

class Assets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final assetsProvider = context.watch<AssetsProvider>();

    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child: Container(
            child: assetsProvider.loading
                ? Container(child: Center(child: CircularProgressIndicator()))
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 10/2
                    ),
                    itemBuilder: (context, int idx) => Asset(assetsProvider.assets[idx]),
                    itemCount: assetsProvider.assets.length)
        ));
  }
}
