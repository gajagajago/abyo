import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Transaction extends StatelessWidget {
  final Map transaction;

  Transaction(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                margin: EdgeInsets.only(
                  right: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey[300],
                    width: 1,
                  )
                ),
                child: Text(transaction['amount'].toString()),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      transaction['title'],
                      style: TextStyle(
                          fontSize: 16
                      )
                  ),
                  Text(
                      DateFormat('yyyy-MM-dd').format(DateTime.parse(transaction['date'])),
                      style: TextStyle(
                          fontSize: 12
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
