import 'package:flutter/material.dart';
import 'package:flutter_quiz/screens/asset_app/asset_app.dart';

class InheritedAssetApp extends InheritedWidget {
  final AssetAppState assetAppState;

  InheritedAssetApp({this.assetAppState, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedAssetApp old) => true;

  static InheritedAssetApp of(BuildContext context) => context.dependOnInheritedWidgetOfExactType();
}
