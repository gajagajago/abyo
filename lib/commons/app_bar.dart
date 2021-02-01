import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

PreferredSizeWidget appBar({String title}) {
  if (Platform.isAndroid) {
    return AppBar(
      title: Text(title),
      leading: Container(),
    );
  } else {
    return CupertinoNavigationBar(
      middle: Text(title),
      leading: Container(),
    );
  }
}
