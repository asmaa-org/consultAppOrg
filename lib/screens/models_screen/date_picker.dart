import 'package:flutter/material.dart';

class MyDatePicker extends StatefulWidget {
  final void Function(DateTime) onDateSelected;

  const MyDatePicker({Key? key, required this.onDateSelected})
      : super(key: key);

  @override
  _MyDatePickerState createState() => _MyDatePickerState();
}

class _MyDatePickerState extends State<MyDatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(selectedDate); // call the callback function
    }
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.date_range,color: Colors.red,),
      onPressed: () => _selectDate(context),
    );
  }
}
