import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../modals/modal_add_transaction.dart';
import '../../commons/app_bar.dart';
import 'asset_app_body.dart';
import '../../providers/assets_provider.dart';
import '../../providers/authenticate.dart';
import 'asset_app_floating.dart';

class AssetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AssetsProvider(authToken: context.read<Authenticate>().authToken),
      child: Scaffold(
        appBar: appBar(title: '자산관리'),
        body: AssetAppBody(),
        floatingActionButton: AssetAppFloating()
      )
    );
  }
}
