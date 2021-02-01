import 'package:flutter/material.dart';
import '../../commons/app_bar.dart';
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
    return Scaffold(
      appBar: appBar(title: '프로필'),
      body: Container(
        child: Column(
          children: [
            SignOut()
          ],
        ),
      ),
    );
  }
}
