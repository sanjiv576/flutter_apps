import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/simpleInterestRoute');
                  },
                  child: const Text('Simple Interest')),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/arithmeticRoute');
                  },
                  child: const Text('Arithmetic Calculation')),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/circleRoute');
                  },
                  child: const Text('Area of Circle')),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/changeNameRoute');
                  },
                  child: const Text('Change Name')),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/richTextRoute');
                  },
                  child: const Text('Rich Text')),
            ),const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/columnRoute');
                  },
                  child: const Text('Column')),
            ),
            const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/containerRoute');
                  },
                  child: const Text('Container')),
            ),
             const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/loadImageRoute');
                  },
                  child: const Text('Load Image'),),
            ),
              const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/studentDetailRoute');
                  },
                  child: const Text('Student Detail'),),
            ),
             const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/mediaQueryRoute');
                  },
                  child: const Text('Media Query'),),
            ),
              const SizedBox(
              height: 10.0,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/clasExerciseRoute');
                  },
                  child: const Text('Class Exercise')),
            )
          ],
        ),
      )),
    );
  }
}


