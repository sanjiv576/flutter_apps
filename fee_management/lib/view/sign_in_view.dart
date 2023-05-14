import 'package:flutter/material.dart';

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

  @override
  void didChangeDependencies() {
    students = ModalRoute.of(context)!.settings.arguments as List<Student>?;
    super.didChangeDependencies();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      int index = -1;
      for (var student in students!) {
        index++;
        if (student.username == _usernameController.text.trim() &&
            student.password == _passwordController.text.trim()) {
          Navigator.pushNamed(context, '/dashboardRoute',
              arguments: {'student': students![index], 'index': index});
        } else {}
      }
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
