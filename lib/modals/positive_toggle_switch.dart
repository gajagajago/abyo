import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/asset_app/inherited_modal_add_transaction.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PositiveToggleSwitch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PositiveToggleSwitchState();
  }
}

class _PositiveToggleSwitchState extends State<PositiveToggleSwitch> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.15,
          maxHeight: MediaQuery.of(context).size.height * 0.1,
        ),
        child: FlutterSwitch(
          toggleSize: 30,
          // value: false,
          value: InheritedModalAddTransaction.of(context).modalAddTransactionState.formKey['positive'],
          borderRadius: 30.0,
          padding: 2.0,
          activeToggleColor: Colors.red,
          inactiveToggleColor: Colors.blue,
          activeSwitchBorder: Border.all(
            color: Colors.red,
            width: 2.0,
          ),
          inactiveSwitchBorder: Border.all(
            color: Colors.blue,
            width: 2.0,
          ),
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          activeIcon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          inactiveIcon: Icon(
            Icons.remove,
            color: Colors.white,
          ),
          onToggle: (val) {
            InheritedModalAddTransaction.of(context).modalAddTransactionState.setFormKey(key: 'positive', value: val);
          }
        ),
        // child: Text(InheritedModalAddTransaction.of(context).modalAddTransactionState.formKey['positive'].toString()),
      )
    );
  }
}
