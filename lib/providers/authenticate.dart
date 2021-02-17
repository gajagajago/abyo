import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Authenticate with ChangeNotifier {
  String _authToken;

  Authenticate() {
    initAuthToken();
  }

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

  Future<bool> saveAuthToken(String authToken) async {
    print("REACHED SAVE AUTH TOKEN WITH $authToken");
    return await FlutterSession().set('authentication_token', authToken)
        .then((value) => value)
        .catchError((error) => error);
  }
}
