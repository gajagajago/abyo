import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class HomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeAppState();
  }
}

class _HomeAppState extends State<HomeApp> {
  Future<String> authenticationToken;

  @override
  void initState() {
    super.initState();
    authenticationToken = initAuthToken();
  }

  Future<String> initAuthToken() async {
    return await FlutterSession().get('authentication_token');
  }

  Future<void> signOut() async {
    await FlutterSession().set('authentication_token', '');
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
      body: Container(
        child: FutureBuilder(
          future: authenticationToken,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ConditionalBuilder(
                condition: snapshot.data.length > 0,
                builder: (context) => Column(
                  children: [
                    RaisedButton(
                      child: Text('Quiz App'),
                      onPressed: () => Navigator.pushNamed(context, '/quiz'),
                    ),
                    RaisedButton(
                      child: Text('Asset App'),
                      onPressed: () => Navigator.pushNamed(context, '/asset'),
                    ),
                    RaisedButton(
                      child: Text('Sign out'),
                      onPressed: () => signOut(),
                    )
                  ],
                ),
                fallback: (context) => Column(
                    children: [
                      RaisedButton(
                        child: Text('Sign Up'),
                        onPressed: () => Navigator.pushNamed(context, '/sign_up'),
                      ),
                      RaisedButton(
                        child: Text('Sign In'),
                        onPressed: () => Navigator.pushNamed(context, '/sign_in'),
                      ),
                    ]
                )
              );
            }
            else {
              return CircularProgressIndicator();
            }
          }
        )
      ),
    );
  }
}
//
// Future<void> signOut() async {
//   await FlutterSession().set('authentication_token', null);
// }
