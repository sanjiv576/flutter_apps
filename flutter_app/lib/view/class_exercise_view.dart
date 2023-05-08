import 'package:flutter/material.dart';

class ClassExerciseView extends StatelessWidget {
  const ClassExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rows and Column'),
      ),
      body: Column(
        children: [
          Expanded(
            // fit: FlexFit.loose,
            child: Container(
              height: height * .15,
              color: Colors.teal,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: Colors.blue,
                      width: width / 3,
                      height: height,
                      child: const Text('Container 1'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      width: width / 3,
                      height: height,
                      child: const Text('Container 2'),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      width: width / 3,
                      height: height,
                      child: const Text('Container 3'),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: Colors.pink,
              // height: height / 3,
              child: const Text('Container 1'),
            ),
          ),
          Expanded(
            // fit: FlexFit.tight,
            child: Container(
              // height: height / 3,
              alignment: Alignment.center,
              color: Colors.teal,
              child: const Text('Container 2'),
            ),
          ),
          Expanded(
            child: Container(
              // height: height / 3,
              alignment: Alignment.center,
              color: Colors.pink,
              child: const Text('Container 3'),
            ),
          ),
        ],
      ),
    );
  }
}
