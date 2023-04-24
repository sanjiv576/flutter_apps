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

  // for storing values
  double principalValue = 0.0;
  double timeValue = 0.0;
  double rateValue = 0.0;
  double result = 0.0;
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
            child: Column(
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                TextField(
                  onChanged: (value) {
                    principalValue = double.parse(value);
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
                TextField(
                  onChanged: (value) {
                    rateValue = double.parse(value);
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
                TextField(
                  onChanged: (value) {
                    timeValue = double.parse(value);
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
                      setState(() {
                        result = simpleInterest.calculateSI(
                            principal: principalValue,
                            time: timeValue,
                            rate: rateValue);
                      });
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
    );
  }
}
