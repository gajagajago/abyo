import 'package:flutter/material.dart';

class Asset extends StatelessWidget {
  final Map<String, dynamic> asset;

  Asset(this.asset);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          setIcon(asset['category']),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text('${asset['amount']} 원')
          )
        ],
      )
    );
  }
}

Icon setIcon(String category) {
  if (category == 'stock') {
    return Icon(Icons.monetization_on_outlined);
  } else if (category == 'real_estate') {
    return Icon(Icons.apartment);
  } else if (category == 'bank') {
    return Icon(Icons.atm);
  } else if (category == 'cash') {
    return Icon(Icons.money);
  } else {
    return Icon(Icons.more_horiz);
  }
}

// class _AssetState extends State<Asset> {
//   var asset;
//
//   _AssetState(asset);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text('item'),
//         Text(asset['category'])
//         // Text(asset['amount'])
//       ],
//     );
//   }
// }
