// import 'dart:io' show Platform;
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../../helpers/helper_function.dart';
//
// class Transaction extends StatefulWidget {
//   final Map<String, dynamic> transaction;
//   final Function initAssets;
//   final Function initTransactions;
//
//   Transaction(this.transaction, this.initAssets, this.initTransactions);
//
//   @override
//   State<StatefulWidget> createState() {
//     return _TransactionState();
//   }
// }
//
// class _TransactionState extends State<Transaction> {
//   Future<void> destroyTransaction() async {
//     var url = Platform.isAndroid
//         ? 'http://10.0.2.2:3000/api/v1/assets/${widget.transaction['asset']['id']}/transactions/${widget.transaction['id']}'
//         : 'http://127.0.0.1:3000/api/v1/assets/${widget.transaction['asset']['id']}/transactions/${widget.transaction['id']}';
//
//     final response = await http.delete(url);
//
//     if (response.statusCode == 200) {
//       Future.delayed(const Duration(milliseconds: 0), () {
//         widget.initAssets();
//         widget.initTransactions();
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dismissible(
//       key: ValueKey(widget.transaction['id']),
//       background: Container(
//         color: Colors.red,
//         padding: EdgeInsets.symmetric(
//           horizontal: 20
//         ),
//         alignment: AlignmentDirectional.centerEnd,
//         child: Icon(Icons.delete, color: Colors.white),
//       ),
//       direction: DismissDirection.endToStart,
//       onDismissed: (direction) => destroyTransaction(),
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 8,
//           vertical: 4,
//         ),
//         child: Container(
//           padding: EdgeInsets.all(8),
//           width: double.infinity,
//           color: Colors.white,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     HelperFunction().assetCategory(widget.transaction['asset']['category']),
//                     style: TextStyle(
//                         fontSize: 16
//                     ),
//                   ),
//                   Text(
//                     DateFormat("yyyy-MM-dd").format(DateTime.parse(widget.transaction['time'])),
//                     style: TextStyle(
//                         color: Colors.grey
//                     ),
//                   )
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     widget.transaction['title'],
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold
//                     ),
//                   ),
//                   amount(widget.transaction['amount'])
//                 ],
//               )
//             ],
//           ),
//         ),
//       )
//     );
//   }
// }
//
// Text amount(double amount) {
//   return Text(
//     HelperFunction().moneyFormatter(currency: 'krw', amount: amount),
//     style: TextStyle(
//         color: amount >= 0 ? Colors.red : Colors.blue,
//         fontSize: 18,
//         fontWeight: FontWeight.w500
//     ),
//   );
// }
