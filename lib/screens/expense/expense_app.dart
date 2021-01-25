// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:io' show Platform;
// import 'package:http/http.dart' as http;
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
//
// import 'transaction.dart';
// import '../../modals/modal_add_transaction.dart';
//
// class ExpenseApp extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _ExpenseAppState();
//   }
// }
//
// class _ExpenseAppState extends State<ExpenseApp> {
//   Future<TransactionTable> transactions;
//
//   _ExpenseAppState({this.transactions});
//
//   @override
//   void initState() {
//     super.initState();
//     transactions = fetchTransactionTable();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Expense App'),
//         ),
//         body: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               child: Card(
//                 child: Text('Chart'),
//                 elevation: 5,
//               ),
//             ),
//             FutureBuilder<TransactionTable>(
//               future: transactions,
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return Expanded(
//                     child: ListView(
//                       scrollDirection: Axis.vertical,
//                       shrinkWrap: true,
//                       children: [
//                         ...(snapshot.data.transactions as List<dynamic>)
//                             .map((t) => Transaction(t))
//                       ],
//                     ),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Text('sorry');
//                 } else {
//                   return CircularProgressIndicator();
//                 }
//               },
//             ),
//           ],
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () => showMaterialModalBottomSheet(
//             context: context,
//             builder: (context) => ModalAddTransaction(assets),
//           ),
//           child: Icon(Icons.add_rounded),
//           backgroundColor: Colors.blue,
//         ),
//       ),
//     );
//   }
// }
//
// class TransactionTable {
//   var transactions;
//
//   TransactionTable({this.transactions});
//
//   factory TransactionTable.fromJson(List <dynamic> json) {
//     return TransactionTable(transactions: json);
//   }
// }
//
// Future<TransactionTable> fetchTransactionTable() async {
//   var url = Platform.isAndroid ? 'http://10.0.2.2:3000/api/v1/transactions' : 'http://127.0.0.1:3000/api/v1/transactions';
//   final response =
//   await http.get(url);
//
//   if (response.statusCode == 200) {
//     return TransactionTable.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load transactions');
//   }
// }
