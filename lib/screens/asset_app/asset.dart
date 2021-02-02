import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helpers/helper_function.dart';
import 'asset_icon.dart';

class Asset extends StatelessWidget {
  final Map<String, dynamic> asset;
  final Function setCategory;

  Asset(this.asset, this.setCategory);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: () => setCategory(asset['id']),
        child: Row(
          children: [
            AssetIcon(category: asset['category']),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text('${HelperFunction().moneyFormatter(currency: 'krw', amount: asset['amount'])}')
            )
          ],
        )
      ),
    );
  }
}

