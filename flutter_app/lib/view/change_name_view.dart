import 'package:flutter/material.dart';

import '../model/change_name.dart';

class ChangeNameView extends StatefulWidget {
  const ChangeNameView({super.key});

  @override
  State<ChangeNameView> createState() => _ChangeNameViewState();
}

class _ChangeNameViewState extends State<ChangeNameView> {
  final ChangeName _changeName = ChangeName();

  String _name = 'Click Me';

  void getNextName() {
    setState(() {
      _name = _changeName.getName();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Name'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Center(
        child: ElevatedButton(
          onPressed: () {
            getNextName();
          },
          child: Text(_name.toString()),
        ),
      )),
    );
  }
}
