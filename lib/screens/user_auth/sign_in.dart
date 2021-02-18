import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io' show Platform;
import '../../commons/app_bar.dart';
import 'package:provider/provider.dart';
import '../../providers/authenticate.dart';

class SignIn extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(title: '로그인'),
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
                      '이메일',
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
                      '비밀번호',
                    ),
                    obscureText: true,
                    valueTransformer: (text) => text.trim(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                    ]),
                    keyboardType: TextInputType.text,
                  ),
                  FlatButton(
                      onPressed: () {
                        if (_formKey.currentState.saveAndValidate()) {
                          signIn(_formKey.currentState.value)
                              .then((val) => context.read<Authenticate>().saveAuthToken(val))
                              .then((val) => Navigator.of(context).popUntil((route) => route.isFirst));
                        }
                      },
                      child: const Text('확인')
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}

Future signIn(var params) async {
  final String url = Platform.isAndroid ? 'http://10.0.2.2:3000/api/v1/sign_in' : 'http://127.0.0.1:3000/api/v1/sign_in';

  final response = await http.post(
      url,
      headers: {'Content-Type': "application/json"},
      body: jsonEncode(params)
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body)['authentication_token'];
  }
}
