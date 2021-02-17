import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Authenticate with ChangeNotifier {
  String _authToken;

  String get authToken => _authToken;
  set authToken(token) => _authToken = token;

  void initAuthToken() async {
    await FlutterSession()
        .get('authentication_token')
        .then((value) {
          this.authToken = value;
          print("Auth token init: $value");
          notifyListeners();
        })
        .catchError((error) => print(error));
  }
}
