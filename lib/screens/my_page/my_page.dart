import 'package:flutter/material.dart';
import '../user_auth/sign_out.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyPageState();
  }
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight * 2 - MediaQuery.of(context).padding.vertical;

    return Scaffold(
      body: Container(
        height: bodyHeight,
        child: Column(
          children: [
            Center(
              child: SignOut(),
            )
          ],
        ),
      ),
    );
  }
}
