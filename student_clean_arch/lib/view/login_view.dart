import 'package:flutter/material.dart';

import '../widget/custom_textformfield_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  SizedBox gap = const SizedBox(height: 20);
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();

    usernameController.dispose();
    passwordController.dispose();
  }

  void submit() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextFormFieldWidget(
                    hideText: false,
                    controllerName: usernameController,
                    textName: 'Username'),
                gap,
                CustomTextFormFieldWidget(
                    hideText: true,
                    controllerName: passwordController,
                    textName: 'Password '),
                gap,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          submit();
                        }
                      },
                      child: const Text('Login')),
                ),
                gap,
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/registerRoute');
                  },
                  child: const Text('Go to Register Screen'),
                ),
                gap,
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/batchRoute');
                  },
                  child: const Text('Go to Batch Screen'),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
