import 'package:flutter/material.dart';
import '../screens/asset_app/inherited_modal_add_transaction.dart';

class TransactionAmountTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionAmountTextFieldState();
  }
}

class _TransactionAmountTextFieldState extends State<TransactionAmountTextField> {
  final amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    amountController.addListener(() {
      InheritedModalAddTransaction.of(context).modalAddTransactionState.setFormKey(key: 'amount', value: amountController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isStock = InheritedModalAddTransaction.of(context).modalAddTransactionState.formKey['asset_category'] == 'stock';

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: isStock? '수량' : '금액',
            ),
            controller: amountController,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
