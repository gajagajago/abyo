import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class DatePickerTextButton extends StatefulWidget {
  final Function setFormKey;

  DatePickerTextButton(this.setFormKey);

  @override
  State<StatefulWidget> createState() {
    return _DatePickerTextButtonState();
  }
}

class _DatePickerTextButtonState extends State<DatePickerTextButton> {
  String dateText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: GestureDetector(
        onTap: () {
          DatePicker.showDatePicker(
              context, showTitleActions: true,
              minTime: DateTime.now().subtract(Duration(days: 365 * 10)),
              maxTime: DateTime.now().add(Duration(days: 365 * 10)),
              onConfirm: (date) {
                widget.setFormKey(key: 'time', value: DateFormat("yyyy-MM-dd").format(date).toString());
                dateText = DateFormat("yyyy-MM-dd").format(date).toString();
              },
              currentTime: DateTime.now(),
              locale: LocaleType.ko
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                  bottom: BorderSide(
                      width: 1,
                      color: Colors.black26
                  )
              )
          ),
          child: Text(dateText),
        ),
      )
    );
  }
}
