import 'package:flutter/material.dart';

class OutputView extends StatefulWidget {
  OutputView({super.key});

  @override
  State<OutputView> createState() => _OutputViewState();
}

class _OutputViewState extends State<OutputView> {
// store for the result
  double? result;

// 1st executes
  @override
  void initState() {
    super.initState();
  }

  // 2nd execution after initstate to find the context
  @override
  void didChangeDependencies() {
    // convert Object type into double
    result = ModalRoute.of(context)!.settings.arguments as double?;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('Output'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Text('Result is ${result.toString()}'),
        ),
      ),
    );
  }
}
