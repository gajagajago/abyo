import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_quiz/screens/home/home_app.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;
import 'package:flutter_session/flutter_session.dart';

class SignIn extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Sign In'),
            ),
            body: Column(
              children: [
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
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
                              signIn(_formKey.currentState.value).then((value) => {
                                if (value) {
                                  Navigator.of(context).pushReplacementNamed('/')
                                }
                              })
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

Future<bool> signIn(var params) async {
  final String url = Platform.isAndroid ? 'http://10.0.2.2:3000/api/v1/sign_in' : 'http://127.0.0.1:3000/api/v1/sign_in';

  final response = await http.post(
      url,
      headers: {'Content-Type': "application/json"},
      body: jsonEncode(params)
  );

  if (response.statusCode == 200) {
    return saveAuthToken(jsonDecode(response.body)['authentication_token']);
  } else {
    return false;
  }
}

Future<bool> saveAuthToken(String authToken) async {
  await FlutterSession().set('authentication_token', authToken);

  return FlutterSession().get('authentication_token') != null;
}
