import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/arithmetic.dart';

final resultProvider = StateProvider((ref) => 0);

class AddView extends ConsumerStatefulWidget {
  const AddView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddViewState();
}

class _AddViewState extends ConsumerState<AddView> {
  final firstController = TextEditingController();
  final secondController = TextEditingController();
  int result = 0;

  @override
  void dispose() {
    super.dispose();

    firstController.dispose();
    secondController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: firstController,
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
              decoration: InputDecoration(
                labelText: 'Enter second number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    int first = int.parse(firstController.text.trim());
                    int second = int.parse(secondController.text.trim());

                    // Singleton instance of Arithmetic
                    var arithmetic = ref.read(arithmeticProvider);
                    ref.read(resultProvider.notifier).state =
                        arithmetic.add(first, second);
                  },
                  child: const Text('Add')),
            ),
            const SizedBox(height: 20),
            Text('Result: ${ref.watch(resultProvider)}'),
          ],
        ),
      )),
    );
  }
}
