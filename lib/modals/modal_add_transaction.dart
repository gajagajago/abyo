import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ModalAddTransaction extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final Future<List<dynamic>> assets;

  ModalAddTransaction(this.assets);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        children: [
          FutureBuilder(
            future: assets,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
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
                              ...(snapshot.data as List).map((a) =>
                                  FormBuilderFieldOption(
                                      value: a['id'], child: Text(a['category'])))
                            ],
                          ),
                          FormBuilderTextField(
                            name: 'title',
                            decoration: InputDecoration(
                              labelText: 'title',
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
                              labelText: 'amount',
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              FormBuilderValidators.numeric(context),
                            ]),
                            keyboardType: TextInputType.text,
                          ),
                          FormBuilderTextField(
                            name: 'date',
                            decoration: InputDecoration(
                              labelText: 'date',
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
                                child: Text("Submit"),
                                onPressed: () {
                                  if (_formKey.currentState.saveAndValidate()) {
                                    createTransaction(_formKey.currentState.value).then((value) => {
                                      Navigator.of(context).popAndPushNamed('/asset')
                                    });
                                  }
                                },
                              ),
                              MaterialButton(
                                child: Text("Reset"),
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
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )
        ],
      ),
    );
  }
}

Future<bool> createTransaction(var params) async {
  var url = Platform.isAndroid
      ? 'http://10.0.2.2:3000/api/v1/assets/${params['category']}/transactions'
      : 'http://127.0.0.1:3000/api/v1/assets/${params['category']}/transactions';

  final response = await http.post(
      url,
      headers: {'Content-Type': "application/json"},
      body: jsonEncode(params)
  );

  return response.statusCode == 200;
}
