import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Authenticate with ChangeNotifier {
  String _authToken;
  String sampleText = 'here';

  Authenticate() {
    initAuthToken();
  }

  String get authToken => _authToken;
  set authToken(token) {
    _authToken = token;
    notifyListeners();
  }

  void initAuthToken() async {
    await FlutterSession()
        .get('authentication_token')
        .then((value) => this.authToken = value)
        .catchError((error) => print(error));
  }

  Future saveAuthToken(String authToken) async {
    this.authToken = authToken;
    await FlutterSession().set('authentication_token', authToken);
  }
}
