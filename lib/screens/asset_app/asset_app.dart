import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../modals/modal_add_transaction.dart';
import '../../commons/app_bar.dart';
import 'asset_app_body.dart';
import '../../providers/assets_provider.dart';
import '../../providers/authenticate.dart';

class AssetApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: '자산관리'),
      body: ChangeNotifierProvider(
        create: (_) => AssetsProvider(authToken: context.read<Authenticate>().authToken),
        child: AssetAppBody(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(Icons.add_rounded),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

// class AssetAppState extends State<AssetApp> {
//   Future<List<dynamic>> assets;
//   Future<List<dynamic>> transactions;
//   int assetCategoryId;
//
//   AssetAppState({this.assets, this.transactions});
//
//   @override
//   void initState() {
//     super.initState();
//     initAssets();
//     initTransactions();
//   }
//
//   void initAssets() {
//     setState(() {
//       assets = fetchAssets();
//     });
//   }
//
//   void initTransactions() {
//     setState(() {
//       transactions = fetchTransactions();
//     });
//   }
//
//   void setCategory(int assetId) {
//     setState(() {
//       assetCategoryId = assetId;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return InheritedAssetApp(
//       child: Scaffold(
//         appBar: appBar(title: '자산관리'),
//         body: ChangeNotifierProvider(
//           create: (_) => AssetsProvider(authToken: context.read<Authenticate>().authToken),
//           lazy: false,
//           child: AssetAppBody(),
//         )
//         ,floatingActionButton: FloatingActionButton(
//           onPressed: () => showModalBottomSheet(
//             backgroundColor: Colors.transparent,
//             context: context,
//             isScrollControlled: true,
//             builder: (context) => FutureBuilder(
//                 future: assets,
//                 builder: (context, snapshot) {
//                   if (snapshot.hasData) {
//                     return ModalAddTransaction(snapshot.data as List<dynamic>,
//                         initAssets, initTransactions);
//                   } else {
//                     return Container();
//                   }
//                 }),
//           ),
//           child: Icon(Icons.add_rounded),
//           backgroundColor: Colors.blue,
//         ),
//       ),
//       assetAppState: this,
//     );
//   }
// }
