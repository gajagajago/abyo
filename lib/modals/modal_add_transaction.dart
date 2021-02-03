import 'dart:convert';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../helpers/helper_function.dart';
import '../commons/date_picker_text_button.dart';
import '../screens/asset_app/stock_searcher.dart';

class ModalAddTransaction extends StatefulWidget {
  final List<dynamic> assets;
  final Function initAssets;
  final Function initTransactions;

  ModalAddTransaction(this.assets, this.initAssets, this.initTransactions);

  @override
  State<StatefulWidget> createState() {
    return _ModalAddTransactionState();
  }
}

class _ModalAddTransactionState extends State<ModalAddTransaction> {
  final _formKey = GlobalKey<FormBuilderState>();
  bool isStock = false;
  bool amountPositive = true;
  List<dynamic> krxMktStock;
  List<dynamic> searchedStockList;

  void changeFormKey(String field, String data) {
    _formKey.currentState.fields[field].didChange(data);
  }

  Future<bool> createTransaction(var params, bool amountPositive) async {
    Map<String, dynamic> paramsFormat = {
      'category': params['category'],
      'title': params['title'],
      'amount': amountPositive ? params['amount'] : '-${params['amount']}',
      'time': params['time']
    };

    var url = Platform.isAndroid
        ? 'http://10.0.2.2:3000/api/v1/assets/${paramsFormat['category']}/transactions'
        : 'http://127.0.0.1:3000/api/v1/assets/${paramsFormat['category']}/transactions';

    final response = await http.post(url,
        headers: {'Content-Type': "application/json"}, body: jsonEncode(paramsFormat));

    if (response.statusCode == 200) {
      widget.initAssets();
      widget.initTransactions();
    }

    return response.statusCode == 200;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            padding: EdgeInsets.all(10),
            margin: MediaQuery.of(context).viewInsets,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: FlutterSwitch(
                      // width: 60.0,
                      height: 30,
                      toggleSize: 30.0,
                      value: amountPositive,
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
                        setState(() {
                          amountPositive = val;
                        });
                      }
                  ),
                ),
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderChoiceChip(
                        name: 'category',
                        decoration: InputDecoration(
                          labelText: '자산 종류',
                        ),
                        options: [
                          ...widget.assets.map((a) => FormBuilderFieldOption(
                              value: a['id'],
                              child: Text(HelperFunction()
                                  .assetCategory(a['category']))))
                        ],
                        onChanged: (val) => {
                          setState(() {
                            isStock = val == 2;
                          })
                        },
                      ),
                      Stack(
                        children: [
                          Column(
                            children: [
                              ConditionalBuilder(
                                  condition: isStock,
                                  builder: (context) {
                                    return FormBuilderField(
                                        name: "title",
                                        validator: FormBuilderValidators.compose([FormBuilderValidators.required(context)]),
                                        builder: (FormFieldState<dynamic> field) {
                                          return InputDecorator(
                                              decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  labelText: "종목",
                                                  errorText: field.errorText
                                              ),
                                              child: StockSearcher(changeFormKey)
                                          );
                                        }
                                    );
                                  },
                                  fallback: (context) {
                                    return FormBuilderTextField(
                                      name: 'title',
                                      decoration: InputDecoration(
                                          labelText: '항목'
                                      ),
                                      valueTransformer: (text) => text.trim(),
                                      validator: FormBuilderValidators.compose([
                                        FormBuilderValidators.required(context),
                                        FormBuilderValidators.max(context, 70),
                                      ]),
                                      keyboardType: TextInputType.text,
                                    );
                                  }
                              ),
                              FormBuilderTextField(
                                name: 'amount',
                                decoration: InputDecoration(
                                    labelText: isStock ? '수량' : '금액'
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(context),
                                  FormBuilderValidators.numeric(context),
                                ]),
                                keyboardType: TextInputType.number,
                              ),
                              FormBuilderField(
                                name: "time",
                                validator: FormBuilderValidators.compose(
                                    [FormBuilderValidators.required(context)]),
                                builder: (FormFieldState<dynamic> field) {
                                  return InputDecorator(
                                      decoration: InputDecoration(
                                        labelText: isStock ? amountPositive ? "매수일자" : "매도일자" : "일자",
                                        errorText: field.errorText,
                                      ),
                                      child: DatePickerTextButton(changeFormKey));
                                },
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  MaterialButton(
                                    child: Text("저장"),
                                    onPressed: () {
                                      if (_formKey.currentState.saveAndValidate()) {
                                        createTransaction(_formKey.currentState.value, amountPositive)
                                            .then((value) => {
                                          Navigator.of(context).pop()
                                        });
                                      }
                                    },
                                  ),
                                  MaterialButton(
                                    child: Text("초기화"),
                                    onPressed: () {
                                      _formKey.currentState.reset();
                                    },
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
        )
    );
  }
}
