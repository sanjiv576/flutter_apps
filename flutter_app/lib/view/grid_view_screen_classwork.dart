import 'package:flutter/material.dart';

class GridViewScreenClasswork extends StatelessWidget {
  const GridViewScreenClasswork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10,  // creates spacce in row
          crossAxisSpacing: 20,  // creates space in column
          children: [
            for (int i = 0; i < 4; i++)
              Container(
                color: Colors.pink,
                child: const Center(child: Text('Card 1')),
              ),
              Container(
                color: Colors.blue,
                child: const Center(child: Text('Card 1')),
              ),
          ],
        ),
      ),
    );
  }
}
