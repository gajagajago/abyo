import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import '../../commons/app_bar.dart';

class HomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeAppState();
  }
}

class _HomeAppState extends State<HomeApp> {
  Future<dynamic> authenticationToken;

  @override
  void initState() {
    super.initState();
    initAuthToken();
  }

 void initAuthToken() {
    setState(() {
      authenticationToken = FlutterSession().get('authentication_token');
    });
  }

  Future<void> signOut() async {
    await FlutterSession().set('authentication_token', '');
    initAuthToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: '홈'),
      body: Container(
        child: FutureBuilder(
          future: authenticationToken,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data.length > 0) {
              return Column(
                children: [
                  RaisedButton(
                    child: Text('내 자산관리'),
                    onPressed: () => Navigator.pushNamed(context, '/asset'),
                  ),
                  RaisedButton(
                    child: Text('로그아웃'),
                    onPressed: () => signOut()
                    ),
                ],
              );
            } else {
              return Column(
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
              );
            }
          }
        )
      ),
    );
  }
}
