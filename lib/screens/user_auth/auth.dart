import 'package:flutter/material.dart';
import '../../commons/app_bar.dart';

class Auth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar({'title': '회원가입/로그인'}),
        body: Column(
            children: [
              RaisedButton(
                child: Text('회원가입'),
                onPressed: () => Navigator.pushNamed(context, '/sign_up'),
              ),
              RaisedButton(
                child: Text('로그인'),
                onPressed: () => Navigator.pushNamed(context, '/sign_in'),
              ),
            ]
        )
    );
  }
}
