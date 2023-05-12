import 'package:flutter/material.dart';
import 'package:flutter_app/common/show_my_snackbar.dart';

class CardWidget {
  static Widget displayCard(
      {required BuildContext context, required String title, int count = 0}) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      // GEsture detector ==> used for detecting gesture like tap, double tap, long press
      child: GestureDetector(
        onTap: () {
          showSnackBar(context: context, message: 'Single tap ${count + 1}');
        },
        onDoubleTap: () {
          showSnackBar(context: context, message: 'Double tap', color: Colors.green);
        },
        onLongPress: (){
          showSnackBar(context: context, message: 'Long press tap', color: Colors.blue);

        },
        child: Card(
          color: Colors.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              '$title ${count + 1}',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
