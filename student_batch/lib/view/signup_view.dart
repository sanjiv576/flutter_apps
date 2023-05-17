import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_batch/common/show_my_snackbar.dart';
import 'package:student_batch/model/student.dart';
import 'package:student_batch/state/batch_state.dart';
import 'package:student_batch/state/student_state.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _studentIdController = TextEditingController();
  final _ageController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confrimPasswordController = TextEditingController();

  String? batchSelected;

  int? age;

  SizedBox gap = const SizedBox(height: 20);
  final _formKey = GlobalKey<FormState>();
  String? _groupValue = 'Gender';

  @override
  void initState() {
    super.initState();

    // dummy student data for testing
    Student student1 = Student(
        studentId: 1234.toString(),
        fname: 'JOhn',
        lname: 'Cena',
        age: 33,
        gender: 'male',
        username: 'john',
        password: 'john123',
        batchId: '30-A');
    Student student2 = Student(
        studentId: 1234.toString(),
        fname: 'Johhy',
        lname: 'Kemmdy',
        age: 33,
        gender: 'male',
        username: 'johhny',
        password: 'johnny123',
        batchId: '30-A');

    StudentState.students.add(student1);
    StudentState.students.add(student2);
  }

  @override
  void dispose() {
    _fnameController.dispose();
    _ageController.dispose();
    _studentIdController.dispose();
    _lnameController.dispose();
    _usernameController.dispose();
    _confrimPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _clearControllers() {
    _fnameController.clear();
    _lnameController.clear();
    _ageController.clear();
    _usernameController.clear();
    _passwordController.clear();
    _confrimPasswordController.clear();
    batchSelected = null;
    _groupValue = null;
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (_confrimPasswordController.text.trim() !=
          _passwordController.text.trim()) {
        showSnackBar(
            context: context,
            message: 'Password and Confirm password do not match.');

        return;
      }

      Student newStudent = Student(
          studentId: 123.toString(),
          fname: _fnameController.text.trim(),
          lname: _lnameController.text.trim(),
          age: int.parse(_ageController.text.trim()),
          gender: _groupValue,
          username: _usernameController.text.trim(),
          password: _passwordController.text.trim(),
          batchId: batchSelected);

      // push the details int the array of Student
      StudentState.students.add(newStudent);
      print('Length of students list : ${StudentState.students.length}');

      showSnackBar(
        context: context,
        message: 'Account has been created successfully.',
        color: Colors.green,
      );
      Navigator.pushNamed(context, '/signInRoute');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.blue,
          margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _fnameController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please, enter first name ' : null,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'Enter first name',
                      hintText: 'E.g John',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                ),
                gap,
                TextFormField(
                  controller: _lnameController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please, enter last name ' : null,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'Enter last name',
                      hintText: 'E.g  Cena',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                ),
                gap,
                TextFormField(
                  controller: _ageController,
                  maxLength: 2,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(2),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  keyboardType: TextInputType.phone,
                  validator: (value) =>
                      value!.isEmpty ? 'Please, enter age ' : null,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'Enter age',
                      hintText: 'E.g 34',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                ),
                gap,
                const Text('Select gender'),
                ListTile(
                    title: const Text('Male'),
                    leading: Radio(
                        value: 'male',
                        groupValue: _groupValue,
                        onChanged: (value) {
                          setState(() {
                            _groupValue = value;
                          });
                        })),
                gap,
                ListTile(
                    title: const Text('Female'),
                    leading: Radio(
                        value: 'female',
                        groupValue: _groupValue,
                        onChanged: (value) {
                          setState(() {
                            _groupValue = value;
                          });
                        })),
                gap,
                ListTile(
                    title: const Text('Other'),
                    leading: Radio(
                        value: 'other',
                        groupValue: _groupValue,
                        onChanged: (value) {
                          setState(() {
                            _groupValue = value;
                          });
                        })),
                gap,
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return 'Please select city';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Select your batch',
                    border: OutlineInputBorder(),
                  ),
                  items: BatchState.batches
                      .map(
                        (batch) => DropdownMenuItem(
                          value: batch,
                          child: Text(batch),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      batchSelected = value;
                    });
                  },
                ),
                gap,
                TextFormField(
                  controller: _usernameController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please, enter username  ' : null,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person_2),
                      labelText: 'Enter username',
                      hintText: 'E.g John',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                ),
                gap,
                TextFormField(
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please, enter your password ' : null,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      labelText: 'Enter your password ',
                      hintText: 'E.g  ***',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                ),
                gap,
                TextFormField(
                  obscureText: true,
                  controller: _confrimPasswordController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please, confrim password ' : null,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.password),
                      labelText: 'Enter confrim password',
                      hintText: 'E.g ***',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      )),
                ),
                gap,
                SizedBox(
                  width: double.infinity,
                  height: 55.0,
                  child: ElevatedButton(
                      onPressed: () {
                        _submit();
                      },
                      child: const Text('Sign up')),
                ),
                gap,
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/signInRoute');
                    },
                    child: const Text(
                      'Have an account ? Sign in',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
