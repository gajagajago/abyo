import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/asset_app/inherited_modal_add_transaction.dart';
import '../helpers/helper_function.dart';
import 'package:provider/provider.dart';
import '../providers/assets_provider.dart';

class AssetCategoryChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('자산종류'),
              Row(
                children: [
                  ...(context.read<AssetsProvider>().assets.map((e) {
                    final modalAddTransaction = InheritedModalAddTransaction.of(context).modalAddTransactionState;
                    bool _selected = InheritedModalAddTransaction.of(context).modalAddTransactionState.formKey['asset_id'] == e.id;

                    return ChoiceChip(
                      selected: _selected,
                      onSelected: (selected) {
                        modalAddTransaction.setFormKey(key: 'asset_id', value: e.id);
                        modalAddTransaction.setFormKey(key: 'asset_category', value: e.category);
                      },
                      selectedColor: Colors.transparent,
                      shape: StadiumBorder(
                          side: BorderSide(
                            color: _selected ? modalAddTransaction.formKey['positive'] ? Colors.red : Colors.blue : Colors.transparent,
                            width: 1.0,
                          )
                      ),
                      label: Text(HelperFunction().assetCategory(e.category)),
                      elevation: 1.0,
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.all(4.0),
                    );
                  }))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ]));
  }
}
