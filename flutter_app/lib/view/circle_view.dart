import 'package:flutter/material.dart';

import '../model/circle.dart';

class CircleView extends StatefulWidget {
  const CircleView({super.key});

  @override
  State<CircleView> createState() => _CircleViewState();
}

class _CircleViewState extends State<CircleView> {
  double _radius = 0;
  double _area = 0.0;

  late Circle _circle;
  void _calculateArea() {
    _circle = Circle();
    setState(() {
      _area = _circle.areaOfCircle(radius: _radius);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Area of Circle'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.phone,
                onChanged: (value) => _radius = double.parse(value),
                decoration: InputDecoration(
                    labelText: 'Enter radius',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    )),
              ),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    _calculateArea();
                  },
                  child: const Text('CALCULATE AREA'),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                'Area of Circle of radius $_radius is $_area',
                style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic),
              )
            ],
          ),
        )),
      ),
    );
  }
}
