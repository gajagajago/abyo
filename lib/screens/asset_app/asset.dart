import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/asset_app/inherited_asset_app.dart';
import '../../helpers/helper_function.dart';
import 'asset_icon.dart';

class Asset extends StatelessWidget {
  final Map<String, dynamic> asset;

  Asset(this.asset);

  @override
  Widget build(BuildContext context) {
    bool isSelectedCategory = InheritedAssetApp.of(context).assetAppState.assetCategoryId == asset['id'];

    return Container(
      child: InkWell(
        onTap: () => {
          InheritedAssetApp.of(context).assetAppState.setCategory(asset['id'])
        },
        child: Row(
          children: [
            AssetIcon(category: asset['category'], id: asset['id'], selected: isSelectedCategory),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                '${HelperFunction().moneyFormatter(currency: 'krw', amount: asset['amount'])}',
                style: TextStyle(
                  fontWeight: isSelectedCategory ? FontWeight.bold : FontWeight.normal
                ),
              )
            )
          ],
        )
      ),
    );
  }
}

