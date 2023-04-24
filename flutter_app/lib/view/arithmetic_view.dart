import 'package:flutter/material.dart';
import '../model/arithmetic.dart';

class ArithmeticView extends StatefulWidget {
  const ArithmeticView({super.key});

  @override
  State<ArithmeticView> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends State<ArithmeticView> {
  //
  Arithmetic arithmetic = Arithmetic();

  double firstNum = 0;
  double secondNum = 0;
  double result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Arithmetic Calculation'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(
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
                SizedBox(
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
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        result = arithmetic.add(firstNumber: firstNum, secondNumber: secondNum);
                      });
                    },
                    child: Text('ADD'),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        result = arithmetic.subtract(firstNumber: firstNum, secondNumber: secondNum);
                      });
                    },
                    child: Text('SUB'),
                  ),
                ),
                Text(
                  'Sum is : $result',
                  style: TextStyle(
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
