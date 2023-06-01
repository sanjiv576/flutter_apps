import 'package:flutter/material.dart';

class StackView extends StatelessWidget {
  const StackView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stack Widget'),
        centerTitle: true,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            color: Colors.yellow,
            height: 400,
            width: double.infinity,
          ),
          Positioned(
            child: Container(
              color: Colors.green,
              height: 400,
              width: double.infinity,
              child: Image.network(
                  'https://img.freepik.com/premium-photo/mountains-during-flowers-blossom-sunrise-flowers-mountain-hills-beautiful-natural-landscape-summer-time-mountainimage_647656-1502.jpg?w=2000'),
            ),
          ),
          // SizedBox(
          //   width: width * .1,
          // ),
          Positioned(
              bottom: 1,
              child: SizedBox(
                // color: Colors.pink,
                height: 70,
                width: width * .3,
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/premium-photo/mountains-during-flowers-blossom-sunrise-flowers-mountain-hills-beautiful-natural-landscape-summer-time-mountainimage_647656-1502.jpg?w=2000'),
                ),
              ))
        ],
      ),
    );
  }
}


// Positioned(
//             top: 10,
//             // right: 1,
//             child: Container(
//               color: Colors.red,
//               height: 100,
//               width: double.infinity,
//             ),
//           ),
//           Positioned(
//             left: 150,
//             bottom: height * .1,
//             child: Container(
//               color: Colors.yellow,
//               height: 100,
//               width: 100,
//             ),
//           )
