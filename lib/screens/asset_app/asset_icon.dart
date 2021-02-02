import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AssetIcon extends StatelessWidget {
  final _defaultColor = Colors.black;
  final String category;
  final int id;
  final bool selected;

  AssetIcon({this.category, this.id, this.selected});

  Color setColor(Color color) {
    return selected ? color : _defaultColor;
  }

  dynamic setIcon(String category) {
    if (category == 'credit') {
      return InkWell(
        child: Icon(
          Icons.credit_card,
          color: setColor(HexColor("#C0C0C0")),
        ),
      );
    } else if (category == 'stock') {
      return InkWell(
          child: Icon(
              Icons.show_chart,
              color: setColor(HexColor("#FFAE42"))
          )
      );
    } else if (category == 'bitcoin') {
      return InkWell(
        child: Icon(
          CupertinoIcons.bitcoin_circle_fill,
          color: setColor(HexColor("#FF9900")),
        ),
      );
    } else if (category == 'bank') {
      return InkWell(
        child: Icon(
          Icons.account_balance_wallet,
          color: setColor(HexColor("#D4AF37")),
        ),
      );
    } else if (category == 'cash') {
      return InkWell(
        child: Icon(
          Icons.money,
          color: setColor(HexColor("#85BB65")),
        ),
      );
    } else {
      return InkWell(
        child: Icon(
          Icons.more_horiz,
          color: setColor(HexColor("#0000FF")),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return setIcon(category);
  }
}


