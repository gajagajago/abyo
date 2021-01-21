import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ModalAddTransaction extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Wrap(
        children: [
          Column(
            children: [
              FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    FormBuilderTextField(
                      name: 'title',
                      decoration: InputDecoration(
                        labelText: 'title',
                      ),
                      // onChanged: _onChanged,
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
                      // onChanged: _onChanged,
                      // valueTransformer: (text) => num.tryParse(text),
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
                              createTransaction(_formKey.currentState.value);
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
          )
        ],
      ),
    );
  }
}

void createTransaction(var params) async {
  var url = Platform.isAndroid
      ? 'http://10.0.2.2:3000/api/v1/transactions'
      : 'http://127.0.0.1:3000/api/v1/transactions';

  final response = await http.post(
    url,
    body: params
  );

  if (response.statusCode == 200) {
    print(response.body);
  } else {
    throw Exception('Failed to create transaction');
  }
}
