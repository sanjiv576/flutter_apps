import 'package:flutter/material.dart';
import '../di/di.dart';
import '../model/user.dart';
import '../repository/user_repository.dart';

class DataEntryView extends StatefulWidget {
  const DataEntryView({Key? key}) : super(key: key);

  @override
  State<DataEntryView> createState() => _DataEntryViewState();
}

class _DataEntryViewState extends State<DataEntryView> {
  final _idController = TextEditingController();
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  SizedBox gap = const SizedBox(height: 20);

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  void _getTimePicker() {
    showTimePicker(
      context: context,
      initialTime: _selectedTime,
    ).then((pickedTime) {
      if (pickedTime == null) return;
      setState(() {
        _selectedTime = pickedTime;
      });
    });
  }

  void _submit() {
    User newUser = User(
      id: int.parse(_idController.text.trim()),
      name: _nameController.text.trim(),
      dob: '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
      birthTime: '${_selectedTime.hour}:${_selectedTime.minute}',
    );

    UserRepository userRepository = getIt<UserRepository>();

    if (userRepository.addUser(newUser)) {
      _idController.clear();
      _nameController.clear();

      _selectedDate = DateTime.now();
      _selectedTime = TimeOfDay.now();

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('User added successfully.'),
        backgroundColor: Colors.green,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Something went wrong.'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Entry'),
      ),
      body: Container(
        margin: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter id' : null,
                controller: _idController,
                decoration: InputDecoration(
                  labelText: 'Enter id',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              gap,
              TextFormField(
                controller: _nameController,
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter name' : null,
                decoration: InputDecoration(
                  labelText: 'Enter name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              gap,
              Row(
                children: [
                  Text('Birth Time: ${_selectedTime.format(context)}'),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _getTimePicker,
                    child: const Text('Choose Time'),
                  ),
                ],
              ),
              gap,
              Row(
                children: [
                  Text(
                      'Date of Birth: ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _presentDatePicker,
                    child: const Text('Choose Date'),
                  ),
                ],
              ),
              gap,
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submit();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
              gap,
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Navigator.pushNamed(context, '/homepageRoute');
                },
                child: const Text('View Details'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
