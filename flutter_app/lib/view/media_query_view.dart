import 'package:flutter/material.dart';

import '../common/show_my_snackbar.dart';

class MediaQueryView extends StatelessWidget {
  const MediaQueryView({super.key});

  @override
  Widget build(BuildContext context) {
    // height of the device whatever the size of the device
    double height = MediaQuery.of(context).size.height;

    // width of the device whatever the size of the device
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Media Query'),
      //   centerTitle: true,
      // ),
      body: Column(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Container(
              width: double.infinity,
              // height: 700,
              color: Colors.pink,
              child: ElevatedButton(
                  onPressed: () {
                    // Snackbar
                    showSnackBar(
                        context: context,
                        message: 'Hello World 1',
                        color: Colors.red);
                  },
                  child: const Text('Click me Snackbar')),
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              // height: 20,
              color: Colors.blue,

              child: ElevatedButton(
                  onPressed: () {
                    // open snackbar
                    showSnackBar(
                        context: context,
                        message: 'Hello World 2',
                        color: Colors.green);
                  },
                  child: const Text('Click me')),
            ),
          ),
          // Container(
          //   width: double.infinity,
          //   height: height /3,
          //   color: Colors.yellow,
          // ),
        ],
      ),
    );
  }
}
