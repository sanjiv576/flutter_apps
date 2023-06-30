import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class PhoneView extends StatefulWidget {
  const PhoneView({super.key});

  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {
  final phoneController = TextEditingController(text: '+9779862579788');

  late final FirebaseAuth? _auth;
  void _initializeFirebase() async {
    print('initaizling');
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    _auth = FirebaseAuth.instance;
    print('completed');
  }

  @override
  void initState() {
    super.initState();

    _initializeFirebase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                  labelText: 'Enter phone number',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: phoneController.text.trim(),
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        Navigator.pushNamed(context, '/signInRoute');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  child: const Text('Submit')),
            )
          ],
        ),
      )),
    );
  }
}
