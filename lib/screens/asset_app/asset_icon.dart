import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AssetIcon extends StatefulWidget {
  final String category;

  AssetIcon({this.category});

  @override
  State<StatefulWidget> createState() {
    return _AssetIconState();
  }
}

class _AssetIconState extends State<AssetIcon> {
  Color _defaultColor = Colors.black;
  Color _onTappedColor;

  @override
  void initState() {
    super.initState();
    _onTappedColor = _defaultColor;
  }

  void _onTap(Color color) {
    setState(() {
      _onTappedColor = _onTappedColor == _defaultColor ? color : _defaultColor;
    });
  }

  dynamic setIcon(String category) {
    if (category == 'credit') {
      return InkWell(
        onTap: () => _onTap(HexColor("#C0C0C0")),
        child: Icon(
          Icons.credit_card,
          color: _onTappedColor,
        ),
      );
    } else if (category == 'stock') {
      return InkWell(
          onTap: () => _onTap(HexColor("#FFAE42")),
          child: Icon(
              Icons.show_chart,
              color: _onTappedColor
          )
      );
    } else if (category == 'bitcoin') {
      return InkWell(
        onTap: () => _onTap(HexColor("#FF9900")),
        child: Icon(
          CupertinoIcons.bitcoin_circle_fill,
          color: _onTappedColor,
        ),
      );
    } else if (category == 'bank') {
      return InkWell(
        onTap: () => _onTap(HexColor("#D4AF37")),
        child: Icon(
          Icons.account_balance_wallet,
          color: _onTappedColor,
        ),
      );
    } else if (category == 'cash') {
      return InkWell(
        onTap: () => _onTap(HexColor("#85BB65")),
        child: Icon(
          Icons.money,
          color: _onTappedColor,
        ),
      );
    } else {
      return InkWell(
        onTap: () => _onTap(HexColor("#0000FF")),
        child: Icon(
          Icons.more_horiz,
          color: _onTappedColor,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return setIcon(widget.category);
  }
}

