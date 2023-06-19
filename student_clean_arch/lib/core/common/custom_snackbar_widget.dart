import 'package:flutter/material.dart';

void showSnackbarMessage(
    {required BuildContext context,
    required String contentText,
    Color? backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      contentText.toString(),
    ),
    backgroundColor: backgroundColor ?? Colors.red,
    elevation: 4,
  ));
}
