import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../helpers/helper_function.dart';

class ModalAddTransaction extends StatefulWidget {
  final List<dynamic> assets;

  ModalAddTransaction(this.assets);

  @override
  State<StatefulWidget> createState() {
    return _ModalAddTransactionState();
  }
}

class _ModalAddTransactionState extends State<ModalAddTransaction> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10)
            )
          ),
        padding: EdgeInsets.all(10),
        margin: MediaQuery.of(context).viewInsets,
        child: Column(
          children: [
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
                  ),
                  FormBuilderTextField(
                    name: 'title',
                    decoration: InputDecoration(
                      labelText: '항목',
                    ),
                    valueTransformer: (text) => text.trim(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.max(context, 70),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                  FormBuilderTextField(
                    name: 'amount',
                    decoration: InputDecoration(
                      labelText: '금액',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.numeric(context),
                    ]),
                    keyboardType: TextInputType.number,
                  ),
                  FormBuilderTextField(
                    name: 'date',
                    decoration: InputDecoration(
                      labelText: '시간',
                    ),
                        // onChanged: _onChanged,
                    // valueTransformer: (text) => num.tryParse(text),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                          FormBuilderValidators.max(context, 70),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        child: Text("저장"),
                        onPressed: () {
                          if (_formKey.currentState.saveAndValidate()) {
                            createTransaction(_formKey.currentState.value)
                                .then((value) => {
                              Navigator.of(context)
                                  .popAndPushNamed('/asset')
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
              ),
            )
          ],
        )
      )
    );
  }
}

Future<bool> createTransaction(var params) async {
  var url = Platform.isAndroid
      ? 'http://10.0.2.2:3000/api/v1/assets/${params['category']}/transactions'
      : 'http://127.0.0.1:3000/api/v1/assets/${params['category']}/transactions';

  final response = await http.post(url,
      headers: {'Content-Type': "application/json"}, body: jsonEncode(params));

  return response.statusCode == 200;
}
