import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({Key? key}) : super(key: key);
  double? principal;

  double? timeValue;

  double? rateValue;

  double simpleInterest = 0;

  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  resetController() {
    principalController.clear();
    rateController.clear();
    timeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Interest Calculator'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: principalController,
                    onChanged: (value) {
                      principal = double.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Principal',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: rateController,
                    onChanged: (value) {
                      rateValue = double.parse(value);
                    },
                    decoration: InputDecoration(
                        hintText: 'Enter rate',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        )),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextField(
                    controller: timeController,
                    onChanged: (value) {
                      timeValue = double.parse(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter time',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (principal != null &&
                            timeValue != null &&
                            rateValue != null) {
                          setState(() {
                            simpleInterest =
                                principal! * timeValue! * rateValue! * 0.01;
                          });
                        }

                        resetController();
                      },
                      child: Text('CALCULATE'),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Simple interest is $simpleInterest',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
