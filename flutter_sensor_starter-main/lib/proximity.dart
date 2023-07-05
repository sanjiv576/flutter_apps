import 'package:flutter/material.dart';

class ProximityScreen extends StatefulWidget {
  const ProximityScreen({super.key});

  @override
  State<ProximityScreen> createState() => _ProximityScreenState();
}

class _ProximityScreenState extends State<ProximityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proximity'),
      ),
      body: const Center(
        child: Text('Proximity'),
      ),
    );
  }
}
