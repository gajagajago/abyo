import 'package:flutter/material.dart';
import '../../modals/modal_add_transaction.dart';

class InheritedModalAddTransaction extends InheritedWidget {
  final ModalAddTransactionState modalAddTransactionState;

  InheritedModalAddTransaction({this.modalAddTransactionState, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedModalAddTransaction old) {
    //somewhat..
    print(this.modalAddTransactionState.formKey);
    return this.modalAddTransactionState.formKey['positive'] != old.modalAddTransactionState.formKey['positive'];
  }

  static InheritedModalAddTransaction of(BuildContext context) => context.dependOnInheritedWidgetOfExactType();
}
