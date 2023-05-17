import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String message, Color color = Colors.red}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
      // backgroundColor: Colors.green,
      backgroundColor: color,
      behavior: SnackBarBehavior.floating,
    ),
  );
}