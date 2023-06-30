// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class AuthenticationRepo {
//   var verificationId = '';
//   Future<void> phoneAuthntication(
//       {required String phoneNum,
//       required BuildContext context,
//       required String otpCode}) async {

//     final auth = FirebaseAuth.instance;
//     await auth.verifyPhoneNumber(
//       phoneNumber: phoneNum,
//       verificationCompleted: (credentials) {
//         // sigin using firebase methods
//         auth.signInWithCredential(credentials);
//       },
//       verificationFailed: (error) {
//         if (error.code == 'invalid-phone-number') {
//           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content: Text('Invalid phone number'),
//             backgroundColor: Colors.red,
//           ));
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//             content: Text('Invalid phone number'),
//             backgroundColor: Colors.red,
//           ));
//         }
//       },
//       codeSent: (verificationId, resendToken) {
//         this.verificationId = verificationId;
//       },
//       codeAutoRetrievalTimeout: (verificationId) {},
//     );
//   }

//   // verifyOT
// }
