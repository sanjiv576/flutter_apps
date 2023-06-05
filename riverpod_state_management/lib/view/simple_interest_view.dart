import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../logic/simple_interest.dart';

// StateProvider --> for changing state

final resultProvider = StateProvider<double>((ref) => 0.0);

class SimpleInterestView extends ConsumerStatefulWidget {
  const SimpleInterestView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SimpleInterestViewState();
}

class _SimpleInterestViewState extends ConsumerState<SimpleInterestView> {
  final principalController = TextEditingController();
  final timeController = TextEditingController();
  final rateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextFormField(
              controller: principalController,
              decoration: InputDecoration(
                labelText: 'Enter principal ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: timeController,
              decoration: InputDecoration(
                labelText: 'Enter time',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: rateController,
              decoration: InputDecoration(
                labelText: 'Enter rate',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    double principal =
                        double.parse(principalController.text.trim());
                    double time = double.parse(timeController.text.trim());
                    double rate = double.parse(rateController.text.trim());

                    // Singleton instance of SimpleINterest
                    var simpleInterest = ref.read(simpleInterestProvider);

                    ref.read(resultProvider.notifier).state =
                        simpleInterest.calculate(
                            principal: principal, time: time, rate: rate);
                  },
                  child: const Text('Calculate Simple Interest')),
            ),
            const SizedBox(height: 20),
            Text('Result: ${ref.watch(resultProvider)}'),
          ],
        ),
      )),
    );
  }
}
