import 'package:flutter/material.dart';

class LoadImageView extends StatelessWidget {
  const LoadImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Load Image'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Single line
            for (int i = 0; i < 5; i++) Text(i.toString()),

            // Using Spread operator for multiplie lines
            // for (int i = 0; i < 10; i++) ...{
            //   const CircleAvatar(
            //     radius: 100,
            //     backgroundColor: Colors.amber,
            //     backgroundImage: AssetImage('assets/images/bird.jpg'),
            //   ),
            // },
            const CircleAvatar(
                radius: 100,
                backgroundColor: Colors.amber,
                backgroundImage: AssetImage('assets/images/bird.jpg'),
              ),

            Image.network(
              'https://shorturl.at/oAFQ5',
              fit: BoxFit.fitHeight,
            ),

            const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage('https://shorturl.at/oAFQ5'),
            )
          ],
        ),
      ),
    );
  }
}
