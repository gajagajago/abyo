import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/authenticate.dart';
import '../../providers/home_provider.dart';
import '../user_auth/auth.dart';
import 'home.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Authenticate>();

    if (auth.authToken == null || auth.authToken == '') {
      return Auth();
    } else {
      return ChangeNotifierProvider(
        create: (_) => HomeProvider(),
        child: Home(),
      );
    }
  }
}
