import 'package:flutter/material.dart';

class BatchView extends StatefulWidget {
  const BatchView({super.key});

  @override
  State<BatchView> createState() => _BatchViewState();
}

class _BatchViewState extends State<BatchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Batch View'),
      ),
      body: const Center(
        child: Text('Batch View'),
      ),
    );
  }
}
