import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart';

PreferredSizeWidget appBar({@required String title, dynamic leading, dynamic trailing}) {
  if (Platform.isAndroid) {
    return AppBar(
      title: Text(title),
      leading: leading,
      actions: trailing == null ? [] : [trailing],
    );
  } else {
    return CupertinoNavigationBar(
      middle: Text(title),
      leading: leading,
      trailing: trailing,
    );
  }
}
