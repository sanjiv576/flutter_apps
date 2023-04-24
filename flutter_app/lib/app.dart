import 'package:flutter/material.dart';

import 'view/arithmetic_view.dart';
import 'view/simple_interest_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SimpleInterestView(),
    );
  }
}
