import 'package:flutter/material.dart';

class ColumnView extends StatelessWidget {
  const ColumnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Widget'),
        centerTitle: true,
      ),
      body: const SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.star,
                size: 60,
                color: Colors.red,
              ),
              Icon(
                Icons.star,
                size: 60,
                color: Colors.blue,
              ),
              Icon(
                Icons.star,
                size: 60,
                color: Colors.red,
              ),
            ],
          ),
          Spacer(),
          Row(
            children: [
              Icon(
                Icons.star,
                size: 60,
                color: Colors.red, 
              ),
              Icon(
                Icons.star,
                size: 60,
                color: Colors.blue,
              ),
              Icon(
                Icons.star,
                size: 60,
                color: Colors.red,
              ),
              Icon(
                Icons.star,
                size: 60,
                color: Colors.blue,
              ),
            ],
          ),
        ],
      )),
    );
  }
}


//  child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Icon(
//                 Icons.star,
//                 size: 60,
//                 color: Colors.red,
//               ),
//               Icon(
//                 Icons.star,
//                 size: 60,
//                 color: Colors.blue,
//               ),
//             ],
//           ),
//           Icon(
//             Icons.star,
//             size: 60,
//             color: Colors.green,
//           ),
//         ],
//       )),
   