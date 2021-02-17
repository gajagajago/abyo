import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

PreferredSizeWidget appBar(dynamic appBarItem) {
  if (Platform.isAndroid) {
    return AppBar(
      title: Text(appBarItem['title']),
      leading: appBarItem['leadingIcon'],
      actions: [appBarItem['trailingIcon']],
    );
  } else {
    return CupertinoNavigationBar(
      middle: Text(appBarItem['title']),
      leading: appBarItem['leadingIcon'],
      trailing: appBarItem['trailingIcon'],
    );
  }
}
