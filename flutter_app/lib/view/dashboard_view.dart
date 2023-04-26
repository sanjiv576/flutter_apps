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
          ],
        ),
      )),
    );
  }
}
