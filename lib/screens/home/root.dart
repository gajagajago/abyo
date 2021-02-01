import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class Root extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootState();
  }
}

class _RootState extends State<Root> {
  @override
  void initState() {
    super.initState();
    initAuthToken();
  }

  void initAuthToken() {
    FlutterSession().get('authentication_token').then((value) => {
      if (value != null && value.length > 0) {
        Navigator.pushReplacementNamed(context, '/home')
      } else {
        Navigator.pushReplacementNamed(context, '/auth')
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator()
    );
  }
}
