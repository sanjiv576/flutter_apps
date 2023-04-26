import 'package:flutter/material.dart';

class RichTextView extends StatelessWidget {
  const RichTextView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rich Text'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: RichText(
          text: const TextSpan(
              text: 'My',
              style: TextStyle(
                fontSize: 40,
                color: Colors.red,
                fontWeight: FontWeight.bold
              ),
              children: <TextSpan>[
                TextSpan(
                    text: ' name is ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0
                    )
                ),
                TextSpan(
                  text: 'Sanjiv Shrestha',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black, fontSize: 20.0,
                  )
                )
              ]),
        ),
      ),
    );
  }
}


//  body: SafeArea(
//         child: Container(
//           // height: double.infinity,
//           width: double.infinity,
//           color: Colors.red,
//           child: const Text(
//             'My name is Sanjiv Shrestha',
//             // textAlign: TextAlign.center,
//             style: TextStyle(
//               fontSize: 30.0,
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//       ),