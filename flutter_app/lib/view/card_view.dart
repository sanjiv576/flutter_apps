import 'package:flutter/material.dart';

import '../widgets/card_widget.dart';

class CardView extends StatelessWidget {
  const CardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return CardWidget.displayCard(context: context, title: 'I am inside');
        },
      )),
    );
  }
}
// NOte: do not use ListView better to use ListView.builder or ListView.separated
// ListView(
//           children: [
//             for (int i = 0; i < 10; i++) ...{
//               CardWidget.displayCard(
//                   context: context, title: 'I am inside', count: i)
//             }
//           ],
//         ),


