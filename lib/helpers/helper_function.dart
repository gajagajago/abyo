import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class HelperFunction {
  String moneyFormatter({String currency, double amount}) {
    switch(currency) {
      case 'krw':
        bool minus = amount < 0;
        String res = '${amount.toInt().abs()}';

        if (res.length >= 9) {
          String eok = replaceZeros(res.substring(0, res.length - 8));
          String man = replaceZeros(res.substring(res.length - 8, res.length - 4));
          String won = replaceZeros(res.substring(res.length - 4));
          return minus? '-$eok억 $man만 $won원' : '$eok억 $man만 $won원';
        } else if (res.length >= 5) {
          String man = replaceZeros(res.substring(0, res.length - 4));
          String won = replaceZeros(res.substring(res.length - 4));
          return minus? '-$man만 $won원' : '$man만 $won원';
        } else {
          return minus? '-$res원' : '$res원';
        }
        break;
      case 'usd':
        return FlutterMoneyFormatter(amount: amount).output.compactSymbolOnLeft;
      default:
        return '';
    }
  }

  String replaceZeros(String digit) {
    while(digit.startsWith(new RegExp(r'0'))) {
      digit = digit.replaceFirst(new RegExp(r'0'), '');
    }

    return digit;
  }

  String assetCategory(String category) {
    switch(category) {
      case 'credit':
        return '카드';
      case 'stock':
        return '주식';
      case 'bitcoin':
        return '비트코인';
      case 'bank':
        return '은행';
      case 'cash':
        return '현금';
      case 'etc':
        return '기타';
      default:
        return '';
    }
  }
}
