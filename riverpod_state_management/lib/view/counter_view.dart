import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// WidgetRef :
// Provider that returns String value
// Provider -> this provider is immutable and only for read purposes
final nameProvider = Provider<String>((ref) => 'Hello World');

// Provider that returns int value
// StateProvider --> changes the state i.e int value
final numberProvider = StateProvider<int>((ref) {
  return 100;
});

// Note : ConsumerWidet == Stateless Widget
class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Text(
          // reading proiver value
          // ref.read(numberProvider).toString(),
          ref.watch(numberProvider).toString(),
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // .notifier is used to access the state of StateProvider
        onPressed: () => ref.read(numberProvider.notifier).state =
            ref.read(numberProvider.notifier).state + 2,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class CounterView extends StatelessWidget {
//   const CounterView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Counter'),
//       ),
//       body: const Center(
//         child: Text(
//           '1',
//           style: TextStyle(
//             fontSize: 24,
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () => {},
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
