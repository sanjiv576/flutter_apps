import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Sensor'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Accelerometer'),
                onPressed: () {
                  Navigator.pushNamed(context, '/accelerometerScreen');
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Gyroscope'),
                onPressed: () {
                  Navigator.pushNamed(context, '/gyroscopeScreen');
                },
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Proximity'),
                onPressed: () {
                  Navigator.pushNamed(context, '/proximityScreen');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
