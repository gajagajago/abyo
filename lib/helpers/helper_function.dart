import 'package:flutter_money_formatter/flutter_money_formatter.dart';

class HelperFunction {
  String moneyFormatter({String currency, double amount}) {
    switch(currency) {
      case 'krw':
        String res = '${amount.toInt()}';
        // String won = money.substring(-1, -4);
        // String man = money.substring(-5, -8);
        // String eok = money.substring(-9);
        // String res;
        //
        // if(man != null) {
        //   res = man + '만 ' + won;
        // }
        //
        // if(eok != null) {
        //   res = eok + '억 ' + res;
        // }

        return res + '원';
      case 'usd':
        return FlutterMoneyFormatter(amount: amount).output.compactSymbolOnLeft;
      default:
        return '';
    }
  }
}
