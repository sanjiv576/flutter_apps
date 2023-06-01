import 'package:flutter/material.dart';

class DateTimeView extends StatefulWidget {
  const DateTimeView({super.key});

  @override
  State<DateTimeView> createState() => _DateTimeViewState();
}

class _DateTimeViewState extends State<DateTimeView> {
  DateTime? selectedDate;

  void _presentDatePicker() {
    // showDatePicker is a pre-made funtion of Flutter
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((pickedDate) {
      // Check if no date is selected
      if (pickedDate == null) {
        return;
      }
      setState(() {
        // using state so that the UI will be rerendered when date is picked
        selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Date time picker'),
      ),
      body: Column(children: [
        // Show the Date Picker when this button clicked
        ElevatedButton(
            onPressed: _presentDatePicker, child: const Text('Select Date')),

        // display the selected date
        Container(
          padding: const EdgeInsets.all(30),
          child: Text(
            selectedDate != null
                ? selectedDate.toString()
                : 'No date selected!',
            style: const TextStyle(fontSize: 30),
          ),
        )
      ]),
    );
  }
}
