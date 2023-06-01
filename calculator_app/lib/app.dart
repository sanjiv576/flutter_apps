import 'package:flutter/material.dart';

import 'view/calculator_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/calculatorRoute',
      routes: {'/calculatorRoute': (context) => const CalculatorView()},
    );
  }
}
