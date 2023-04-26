import 'package:flutter/material.dart';
import '../model/arithmetic.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({super.key});

  @override
  State<ArithmeticView> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<ArithmeticView> {
  double firstNum = 0;
  double secondNum = 0;
  double result = 0;

// late initialization which means I will initialize whenever I need it
  late Arithmetic arithmetic;

  void _sub() {
    // initialized outside of the setState beacause setState rebuilds the UI
    arithmetic = Arithmetic();
    setState(() {
      result =
          arithmetic.subtract(firstNumber: firstNum, secondNumber: secondNum);
    });
  }

  void _add() {
    arithmetic = Arithmetic();
    setState(() {
      result = arithmetic.add(firstNumber: firstNum, secondNumber: secondNum);
    });
  }

  void _multiply() {
    arithmetic = Arithmetic();
    setState(() {
      result =
          arithmetic.multiply(firstNumber: firstNum, secondNumber: secondNum);
    });
  }

  void _divide() {
    arithmetic = Arithmetic();
    setState(() {
      result =
          arithmetic.divide(firstNumber: firstNum, secondNumber: secondNum);
    });
  }

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
            child: Column(
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  onChanged: (value) {
                    firstNum = double.parse(value);
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
                TextField(
                  onChanged: (value) {
                    secondNum = double.parse(value);
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
                      _add();
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
                      _sub();
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
                      _multiply();
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
                      _divide();
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
    );
  }
}
