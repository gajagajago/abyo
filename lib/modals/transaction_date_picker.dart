import 'package:flutter/material.dart';
import 'package:flutter_quiz/commons/date_picker_text_button.dart';
import '../screens/asset_app/inherited_modal_add_transaction.dart';

class TransactionDatePicker extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TransactionDatePickerState();
  }
}

class _TransactionDatePickerState extends State<TransactionDatePicker> {
  @override
  Widget build(BuildContext context) {
    bool isStock = InheritedModalAddTransaction.of(context).modalAddTransactionState.formKey['asset_category'] == 'stock';
    bool isPositive = InheritedModalAddTransaction.of(context).modalAddTransactionState.formKey['positive'] == true;

    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              isStock ? isPositive ? "매수일자" : "매도일자" : "일자",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            DatePickerTextButton(InheritedModalAddTransaction.of(context).modalAddTransactionState.setFormKey),
          ],
        )
      )
    );
  }
}
