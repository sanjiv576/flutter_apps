import 'package:flutter/material.dart';

class GalleryView extends StatelessWidget {
  GalleryView({super.key});

  List<String> natureImages = [
    'https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832_1280.jpg',
    'https://images.unsplash.com/photo-1609560140261-4efaa689b6c8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80',
    'https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297_1280.jpg',
    'https://images.unsplash.com/photo-1515592565726-1356b4a020a6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bmF0dXJlJTIwcG9ydHJhaXR8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: 1000,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: ((context, index) {
          if (index >= natureImages.length) index = 0;
          // print('Index: $index');
          return Container(
            color: Colors.pink,
            height: 60,
            child: Image.network(natureImages[index]),
          );
        }),
      ),
    );
  }
}
