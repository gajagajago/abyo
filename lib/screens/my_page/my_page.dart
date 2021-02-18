import 'package:flutter/material.dart';
import '../user_auth/sign_out.dart';
import '../../commons/app_bar.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bodyHeight = MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight * 2 - MediaQuery.of(context).padding.vertical;

    return Scaffold(
      appBar: appBar(title: '프로필'),
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


