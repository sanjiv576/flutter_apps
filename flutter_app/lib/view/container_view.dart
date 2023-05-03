import 'package:flutter/material.dart';

class ContainerView extends StatelessWidget {
  const ContainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          alignment: Alignment.topRight,
          padding: const EdgeInsets.all(8),
          child: Container(
            height: 200.0,
            width: 200.0,
            // color: Colors.green,  // this is invalid when decoration is used
            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: Colors.green,
              border: Border.all(
                color: Colors.black,
                width: 3.5,
              ),
              shape: BoxShape.circle, // makes container shape as circle
            ),

            child: const Text('Hello World'),
          ),
        ),
      ),
    );
  }
}
