import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  final _formKey = GlobalKey<FormState>();

  final _inputController = TextEditingController();

  final int _value = 0;

  int? firstNum;

  int? secondNum;
  int result = 0;

  String operator = '';

  final List<String> _buttonNames = [
    "C",
    "*",
    "/",
    "<-",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "%",
    "0",
    ".",
    "=",
  ];

  _calulate(operator) {
    switch (operator) {
      case '+':
        setState(() {
          _inputController.text = (firstNum! + secondNum!).toString();
        });
        break;

      case '-':
        setState(() {
          _inputController.text = (firstNum! + secondNum!).toString();
        });
        break;

      case '*':
        setState(() {
          _inputController.text = (firstNum! + secondNum!).toString();
        });
        break;

      case '/':
        setState(() {
          _inputController.text = (firstNum! + secondNum!).toString();
        });
        break;
    }
  }

  void _submit({required String pressedButton}) {
    if (_isNumber(checkValue: pressedButton)) {
      _inputController.text = '${_inputController.text}$pressedButton';
    } else if (pressedButton == 'C') {
      firstNum = 0;
      secondNum = 0;
      _inputController.text = '';
    } else if (_isOperator(operatorName: pressedButton)) {
      // assing value
      firstNum = int.parse(_inputController.text);
      // print('first num = $firstNum');
      // clear the text field
      _inputController.text = '';
    } else if (pressedButton == '=') {
      // assign to the second value
      secondNum = int.parse(_inputController.text);
      _calulate(operator);
    } else if (pressedButton == '<-') {
      _inputController.text =
          _inputController.text.substring(0, _inputController.text.length - 1);
    }
  }

  bool _isNumber({required String checkValue}) {
    return int.tryParse(checkValue) != null;
    // int? value = int.tryParse(checkValue);

    // if (value == 1 ||
    //     value == 2 ||
    //     value == 3 ||
    //     value == 4 ||
    //     value == 5 ||
    //     value == 2 ||
    //     value == 6 ||
    //     value == 7 ||
    //     value == 8 ||
    //     value == 9) {
    //   return true;
    // }
    // return false;
  }

  bool _isOperator({required String operatorName}) {
    if (operatorName == '+' ||
        operatorName == '-' ||
        operatorName == '/' ||
        operatorName == '*') {
      operator = operatorName;
      return true;
    }
    return false;
  }

  // void _operator({required String operationSymbol}) {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculator App',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _inputController,
              textAlign: TextAlign.end,
              decoration: const InputDecoration(hintText: '0'),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              // GridView is inside the Expanded because we do not know how long it needs
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: _buttonNames.length,
                // shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ElevatedButton(
                    onPressed: () {
                      _submit(pressedButton: _buttonNames[index]);
                    },
                    child: Text(
                      _buttonNames[index],
                      style: const TextStyle(fontSize: 29),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
