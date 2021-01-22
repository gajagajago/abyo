import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;

class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Column(
          children: [
            FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'name',
                    decoration: InputDecoration(
                      labelText:
                      'name',
                    ),
                    valueTransformer: (text) => text.trim(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                  FormBuilderTextField(
                    name: 'email',
                    decoration: InputDecoration(
                      labelText:
                      'email',
                    ),
                    valueTransformer: (text) => text.trim(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                  FormBuilderTextField(
                    name: 'password',
                    decoration: InputDecoration(
                      labelText:
                      'password',
                    ),
                    obscureText: true,
                    valueTransformer: (text) => text.trim(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                  FlatButton(
                      onPressed: () => {
                        if (_formKey.currentState.saveAndValidate()) {
                          signUp(_formKey.currentState.value)
                        }
                      },
                      child: Text('Submit')
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

Future<String> signUp(var params) async {
  final String url = Platform.isAndroid ? 'http://10.0.2.2:3000/api/v1/sign_up' : 'http://127.0.0.1:3000/api/v1/sign_up';

  final response = await http.post(
      url,
      headers: {'Content-Type': "application/json"},
      body: jsonEncode(params)
  );

  return '$response';
}
