import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../helpers/helper_function.dart';
import 'asset_icon.dart';
import 'package:provider/provider.dart';
import '../../providers/asset_app/assets_provider.dart';

class Asset extends StatelessWidget {
  final asset;

  Asset(this.asset);

  @override
  Widget build(BuildContext context) {
    print("Build asset");
    final assetsProvider = context.read<AssetsProvider>();
    final bool isSelectedCategory = assetsProvider.assetCategoryId == asset.id;

    return Container(
      child: InkWell(
        onTap: () => assetsProvider.assetCategoryId = asset.id,
        child: Row(
          children: [
            AssetIcon(category: asset.category, id: asset.id, selected: isSelectedCategory),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                '${HelperFunction().moneyFormatter(currency: 'krw', amount: asset.amount)}',
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

