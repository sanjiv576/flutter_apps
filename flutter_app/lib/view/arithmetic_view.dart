import 'package:flutter/material.dart';

import '../model/arithmetic.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({super.key});

  @override
  State<ArithmeticView> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<ArithmeticView> {
// store values of first and secon in controllers
  final firstController = TextEditingController(text: '23');
  final secondController = TextEditingController(text: '45');

  double result = 0;

// late initialization which means I will initialize whenever I need it
  late Arithmetic arithmetic;

// execute this when the app launches
  @override
  void initState() {
    super.initState();
  }



  // since, TextEditingController is a class, which takes memory even thought the app is closed
  // so, it is needed to be disposed/closed
  @override
  void dispose() {
    super.dispose();
    firstController.dispose();
    secondController.dispose();
  }

  void _sub() {
    // initialized outside of the setState beacause setState rebuilds the UI
    arithmetic = Arithmetic();
    setState(() {
      // get values of each controller using <controllerName>.text
      result = arithmetic.subtract(
          firstNumber: double.parse(firstController.text),
          secondNumber: double.parse(secondController.text));
    });
  }

  void _add() {
    arithmetic = Arithmetic();
    setState(() {
      result = arithmetic.add(
          firstNumber: double.parse((firstController.text)),
          secondNumber: double.parse(secondController.text));
    });
  }

  void _multiply() {
    arithmetic = Arithmetic();
    setState(() {
      result = arithmetic.multiply(
          firstNumber: double.parse(firstController.text),
          secondNumber: double.parse(secondController.text));
    });
  }

  void _divide() {
    arithmetic = Arithmetic();
    setState(() {
      result = arithmetic.divide(
          firstNumber: double.parse(firstController.text),
          secondNumber: double.parse(secondController.text));
    });
  }

  // to know the state of the Form, which field is filled or not
  final myKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic Calculation'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // use Form for validation
            child: Form(
              // know the state of the Form
              key: myKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 16.0,
                  ),
                  // use TextFormField for validation not TextField
                  TextFormField(
                    controller: firstController,
                    keyboardType: TextInputType.number,

                    // for user input data validation
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please, enter first no.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter first number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: secondController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) return 'Please, enter second no.';
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter second number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // now, execute the validator
                        if (myKey.currentState!.validate()) {
                          _add();
                        }
                      },
                      child: const Text('ADD'),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // execute the validator
                        if (myKey.currentState!.validate()) {
                          _sub();
                        }
                      },
                      child: const Text('SUB'),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // execute the validator
                        if (myKey.currentState!.validate()) {
                          _multiply();
                        }
                      },
                      child: const Text('MULTIPLY'),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // now, execute the validator
                        if (myKey.currentState!.validate()) {
                          _divide();
                        }
                      },
                      child: const Text('DIVIDE'),
                    ),
                  ),
                  Text(
                    'Result is : $result',
                    style: const TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
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
