import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class SignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('로그아웃'),
      onPressed: () {
        _signOut(context);
        Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
      }
    );
  }
}

Future<void> _signOut(BuildContext context) async {
  await FlutterSession().set('authentication_token', '');
}
