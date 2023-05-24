import 'package:flutter/material.dart';

class ClassworkStackView extends StatelessWidget {
  const ClassworkStackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              GestureDetector(
                onDoubleTap: () {
                  print('Double tap on the screen');
                },
                child: SizedBox(
                  height: 500,
                  width: double.infinity,
                  // color: Colors.pink,
                  child: Image.network(
                      'https://cdn.pixabay.com/photo/2020/11/28/03/19/iron-man-5783522_640.png'),
                ),
              ),
              Positioned(
                top: 1,
                right: 1,
                child: IconButton(
                    onPressed: () {
                      print('Edit icon got pressed');
                    },
                    icon: const Icon(Icons.edit)),
              ),
              Positioned(
                bottom: 1,
                left: 1,
                child: Wrap(
                  children: [
                    IconButton(
                      onPressed: () {
                        print('Like icon got pressed');
                      },
                      icon: const Icon(Icons.thumb_up),
                    ),
                    IconButton(
                      onPressed: () {
                        print('Message icon got pressed');
                      },
                      icon: const Icon(Icons.message),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('student name'),
              Text('Batch'),
            ],
          )
        ],
      )),
    );
  }
}
