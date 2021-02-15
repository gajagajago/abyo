import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

PreferredSizeWidget appBar({String title, IconButton leadingIcon, IconButton trailingIcon}) {
  if (Platform.isAndroid) {
    return AppBar(
      title: Text(title),
      leading: leadingIcon,
      actions: [trailingIcon],
    );
  } else {
    return CupertinoNavigationBar(
      middle: Text(title),
      leading: leadingIcon,
      trailing: trailingIcon,
    );
  }
}
