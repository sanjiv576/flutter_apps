import 'package:flutter/material.dart';

import '../model/simple_interest.dart';

class SimpleInterestView extends StatefulWidget {
  const SimpleInterestView({super.key});

  @override
  State<SimpleInterestView> createState() => _SimpleInterestViewState();
}

class _SimpleInterestViewState extends State<SimpleInterestView> {
  // instantiate of Simple Interest class
  SimpleInterest simpleInterest = SimpleInterest();

  double result = 0.0;

  // stores values of textfield
  final principalController = TextEditingController(text: '1200');
  final timeController = TextEditingController(text: '5');
  final rateController = TextEditingController(text: '2.5');

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    principalController.dispose();
    rateController.dispose();
    timeController.dispose();

    super.dispose();
  }

  void submitAnswer() {
    setState(() {
      if (myKey.currentState!.validate()) {
        result = simpleInterest.calculateSI(
            principal: double.parse(principalController.text),
            time: double.parse(timeController.text),
            rate: double.parse(rateController.text));
      }
    });
  }

// to know the state of the Form
  final myKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest Calculator'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: myKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: principalController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please, enter the principal';
                      } else if (value.length < 2) {
                        return 'Principal should be greater than 2 digits';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Principal',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: rateController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please, enter rate';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter rate',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    controller: timeController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please, enter time';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter time',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        submitAnswer();
                      },
                      child: const Text('CALCULATE'),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Simple interest is $result',
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
