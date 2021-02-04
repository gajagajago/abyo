import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/asset_app/inherited_modal_add_transaction.dart';
import '../helpers/helper_function.dart';

class AssetCategoryChip extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AssetCategoryChipState();
  }
}

class _AssetCategoryChipState extends State<AssetCategoryChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('자산종류'),
      Row(
        children: [
          ...(InheritedModalAddTransaction.of(context)
              .modalAddTransactionState
              .widget
              .assets
              .map((e) => ActionChip(
                    onPressed: () => InheritedModalAddTransaction.of(context)
                        .modalAddTransactionState
                        .setFormKey(key: 'asset_id', value: e['id']),
                    label: Text(HelperFunction().assetCategory(e['category'])),
                    elevation: 1.0,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(4.0),
                  )))
        ],
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ),
    ]));
  }
}
