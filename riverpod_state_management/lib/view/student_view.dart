import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StudentView extends ConsumerStatefulWidget {
  const StudentView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _StudentViewState();
}

class _StudentViewState extends ConsumerState<StudentView> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dobController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  _openDatePicker() {
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
        title: const Text('Student'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: 'First name ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: 'Last name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    onPressed: () {
                      _openDatePicker();
                    },
                    child: const Text('DOB')),
                const Text('daob')
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {}, child: const Text('Add Student')),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
