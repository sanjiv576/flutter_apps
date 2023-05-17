import 'package:flutter/material.dart';
import 'package:student_batch/common/show_my_snackbar.dart';
import 'package:student_batch/state/student_state.dart';

import '../model/student.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  SizedBox gap = const SizedBox(height: 20);
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  List<Student>? students;
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      for (var student in StudentState.students) {
        if (student.username == _usernameController.text.trim() &&
            student.password == _passwordController.text.trim()) {
          showSnackBar(
            context: context,
            color: Colors.green,
            message: 'Logged in as ${student.fname} ${student.lname}',
          );
          Navigator.pushNamed(context, '/dashboardRoute');
          return;
        }
      }
      showSnackBar(
        context: context,
        message: 'Credentials do not match. Try Again',
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please, enter your username ' : null,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        labelText: 'Enter your username ',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        )),
                  ),
                  gap,
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    validator: (value) =>
                        value!.isEmpty ? 'Please,  password ' : null,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.password),
                        labelText: 'Enter  password',
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
                        Navigator.pushNamed(context, '/signUpRoute');
                      },
                      child: const Text('Dont have an account ? Sign up'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
