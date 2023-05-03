import 'package:flutter/material.dart';

class OutputView extends StatelessWidget {
  const OutputView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Output'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Hellow World'),
        ),
      ),
    );
  }
}
