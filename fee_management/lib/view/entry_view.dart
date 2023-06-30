// import 'package:email_otp/email_otp.dart';
// import 'package:fee_management/utils/user_verification.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_email_sender/flutter_email_sender.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

// class EntryView extends StatefulWidget {
//   const EntryView({super.key});

//   @override
//   State<EntryView> createState() => _EntryViewState();
// }

// class _EntryViewState extends State<EntryView> {
//   final _emailController = TextEditingController();

//   final _phoneController = TextEditingController(text: '+15551234567');
//   final _anotherEmailController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();

//   void _submitePhoneNum() async {
//     // List<String> recipients = [
//     //   '1234567890',
//     //   (_phoneController.text.trim()),
//     //   '9862579788'
//     // ]; // Replace with the recipient's phone number
//     // String message =
//     //     'Hello, this is my message! from Flutter'; // Replace with your desired message

//     // String result = await sendSMS(message: message, recipients: recipients)
//     //     .catchError((onError) {
//     //   print(onError);
//     // });

//     print('Message sent successfully!');
//     FlutterPhoneDirectCaller.callNumber(_phoneController.text.trim());
//   }

//   void _submit() async {
//     EmailOTP auth = EmailOTP();
//     auth.setConfig(
//       appEmail: 'noreply@tableReservation.com',
//       appName: 'Table Reservation System - ${UserVerification.getOtp}',
//       userEmail: _emailController.text.trim(),
//       otpLength: 6,
//       otpType: OTPType.digitsOnly,
//     );

//     if (await auth.sendOTP()) {
//       Navigator.pushNamed(context, '/verificationRoute');

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('OTP has been sent successfully.'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Failed to send OTP.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//             child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: _emailController,
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please, enter email  ' : null,
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.call),
//                   labelText: 'Enter your email  ',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       // if (_formKey.currentState!.validate()) {
//                       _submit();
//                       // }
//                     },
//                     child: const Text('Submit Email')),
//               ),
//               const SizedBox(height: 50),
//               TextFormField(
//                 controller: _phoneController,
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please, enter phone number ' : null,
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.call),
//                   labelText: 'Enter your phone number ',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     onPressed: () {
//                       // if (_formKey.currentState!.validate()) {
//                       // _submitePhoneNum();
//                       FlutterPhoneDirectCaller.callNumber(
//                           _phoneController.text);
//                     },
//                     // },
//                     child: const Text('Submit PhoneNum')),
//               ),
//               const SizedBox(height: 40),
//               TextFormField(
//                 controller: _anotherEmailController,
//                 validator: (value) =>
//                     value!.isEmpty ? 'Please, enter email ' : null,
//                 decoration: InputDecoration(
//                   prefixIcon: const Icon(Icons.call),
//                   labelText: 'Enter your email  ',
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                     onPressed: () async {
//                       // String recipientEmail = _anotherEmailController.text
//                       //     .trim(); // Replace with the recipient's email address
//                       // String subject =
//                       //     'Hello'; // Replace with your desired subject
//                       // String body =
//                       //     'This is the body of the email.'; // Replace with your desired email content

//                       // String url =
//                       //     'mailto:$recipientEmail?subject=$subject&body=$body';
//                       // if (await canLaunchUrl(Uri.parse(url))) {
//                       //   await launchUrl(Uri.parse(url));
//                       // } else {
//                       //   throw 'Could not launch email client';
//                       // }

//                       final Email email = Email(
//                         body: 'Email body fro m flutter',
//                         subject: 'Email subject',
//                         recipients: [_anotherEmailController.text.trim()],
//                         // cc: ['cc@example.com'],
//                         // bcc: ['bcc@example.com'],
//                         // attachmentPaths: ['/path/to/attachment.zip'],
//                         isHTML: false,
//                       );

//                       await FlutterEmailSender.send(email);
//                     },
//                     // },
//                     child: const Text('Submit Another Email')),
//               ),
//               const SizedBox(height: 40),
//               TextButton(
//                   onPressed: () => Navigator.pushNamed(context, '/signInRoute'),
//                   child: const Text('Already verified'))
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }
