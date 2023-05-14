import 'package:flutter/material.dart';

import '../model/student.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int? index;
  Student? student;
  Map<String, dynamic>? arguments;
  double amount = 0.0;
  String dueAmount = 'NA';
  final paymentController = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    index = arguments!['index'];
    student = arguments!['student'];

    dueAmount = student!.dueAmount.toString();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    paymentController.dispose();
  }

  void payDue({required double amount}) {
    setState(() {
      student!.dueAmount = student!.dueAmount! - amount;
    });
    paymentController.clear();
  }

  var gap = const SizedBox(height: 20);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          alignment: Alignment.center,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.pink,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/68603/bald-eagle-bird-predator-feathered-68603.jpeg?cs=srgb&dl=pexels-pixabay-68603.jpg&fm=jpg'),
                ),
                gap,
                Text('${student!.fname} ${student!.lname}'),
                gap,
                Text('Due amount : ${student!.dueAmount}'),
                gap,
                TextFormField(
                  controller: paymentController,
                  validator: (value) =>
                      value!.isEmpty ? 'Please, enter amount' : null,
                  decoration: InputDecoration(
                    hintText: 'Enter due amount',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          payDue(
                              amount:
                                  double.parse(paymentController.text.trim()));
                        }
                      },
                      child: const Text('Pay Due')),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
