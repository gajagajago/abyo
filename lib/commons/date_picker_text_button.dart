import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class DatePickerTextButton extends StatefulWidget {
  final Function _changeFormKey;

  DatePickerTextButton(this._changeFormKey);

  @override
  State<StatefulWidget> createState() {
    return _DatePickerTextButtonState();
  }
}

class _DatePickerTextButtonState extends State<DatePickerTextButton> {
  String dateText = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DatePicker.showDatePicker(
            context, showTitleActions: true,
            minTime: DateTime.now().subtract(Duration(days: 365 * 10)),
            maxTime: DateTime.now().add(Duration(days: 365 * 10)),
            onConfirm: (date) {
              widget._changeFormKey('time', DateFormat("yyyy-MM-dd").format(date).toString());
              dateText = DateFormat("yyyy-MM-dd").format(date).toString();
            },
            currentTime: DateTime.now(),
            locale: LocaleType.ko
        );
      },
      // The custom button
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Text(dateText),
      ),
    );  }
}
