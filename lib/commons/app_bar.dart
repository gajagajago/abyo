import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

PreferredSizeWidget appBar({@required String title, dynamic leading = null, dynamic trailing = null}) {
  if (Platform.isAndroid) {
    return AppBar(
      title: Text(title),
      leading: leading,
      actions: trailing,
    );
  } else {
    return CupertinoNavigationBar(
      middle: Text(title),
      leading: leading,
      trailing: trailing,
    );
  }
}
