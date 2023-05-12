import 'dart:math';

import 'package:flutter/material.dart';

class ColorChangeView extends StatelessWidget {
  ColorChangeView({super.key});

  late String containerColor;

  final List<Color> _colorNames = [
    Colors.green,
    Colors.red,
    Colors.blue,
    Colors.amber
  ];

  Color _getContainerColor() => _colorNames[Random().nextInt(4)];

  Widget _displayContainer() {
    return Container(
      color: _getContainerColor(),
      height: 100,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          padding: const EdgeInsets.all(8),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [for (int i = 0; i < 4; i++) _displayContainer()],
        ),
      ),
    );
  }
}
