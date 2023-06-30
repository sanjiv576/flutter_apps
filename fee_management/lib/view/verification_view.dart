import 'package:fee_management/utils/user_verification.dart';
import 'package:flutter/material.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key});

  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submit()  {
    if (UserVerification.checkOtp(yourOTP: int.parse( _emailController.text.trim()))) {
      Navigator.pushNamed(context, '/signInRoute');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid otp'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                validator: (value) =>
                    value!.isEmpty ? 'Please, enter otp ' : null,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.call),
                  labelText: 'Enter otp ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submit();
                      }
                    },
                    child: const Text('Verify me')),
              ),
              TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/signInRoute'),
                  child: const Text('Already verified'))
            ],
          ),
        ),
      )),
    );
  }
}
