import 'package:flutter/material.dart';
import 'package:flutter_sensor/accelerometer.dart';
import 'package:flutter_sensor/dashboard.dart';
import 'package:flutter_sensor/gyroscope.dart';
import 'package:flutter_sensor/proximity.dart'; 

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const DashboardScreen(),
      '/accelerometerScreen': (context) => const AccelerometerScreen(),
      '/gyroscopeScreen': (context) => const GyroscopeScreen(),
      '/proximityScreen': (context) => const ProximityScreen(),
    },
  ));
}
