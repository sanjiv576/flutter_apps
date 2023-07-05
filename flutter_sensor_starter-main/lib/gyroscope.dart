import 'package:flutter/material.dart';

class GyroscopeScreen extends StatefulWidget {
  const GyroscopeScreen({super.key});

  @override
  State<GyroscopeScreen> createState() => _GyroscopeScreenState();
}

class _GyroscopeScreenState extends State<GyroscopeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gyroscope'),
      ),
      body: const Center(
        child: Text('Gyroscope'),
      ),
    );
  }
}
