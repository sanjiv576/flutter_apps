import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/counter'),
              child: const Text('Counter'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/add'),
              child: const Text('Add'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/simpleInterest'),
              child: const Text('Simple Interest'),
            ),
          ],
        ),
      ),
    );
  }
}
