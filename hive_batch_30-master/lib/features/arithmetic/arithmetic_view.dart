import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_and_api_for_class/features/arithmetic/arithmetic.dart';

class ArithmeticView extends ConsumerStatefulWidget {
  const ArithmeticView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ArithmeticViewState();
}

class _ArithmeticViewState extends ConsumerState<ArithmeticView> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  int result = 0;
  void add() {
    setState(() {
      result = Arithmetic.add(
        first: int.parse(firstController.text.trim()),
        second: int.parse(secondController.text.trim()),
      );
    });
  }

  void subtract() {
    setState(() {
      result = Arithmetic.sub(
        first: int.parse(firstController.text.trim()),
        second: int.parse(secondController.text.trim()),
      );
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arithmetic Operations'),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: firstController,
                  keyboardType: TextInputType.number,
                  validator: (value) => value!.isEmpty ? 'Enter number' : null,
                  decoration: InputDecoration(
                    labelText: 'Enter first number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: secondController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter second number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  validator: (value) => value!.isEmpty ? 'Enter number' : null,
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          add();
                        }
                      },
                      child: const Text('Add')),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          subtract();
                        }
                      },
                      child: const Text('Subtract')),
                ),
                const SizedBox(height: 20),
                Text(
                  'Result : $result',
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
