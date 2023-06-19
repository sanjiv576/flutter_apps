import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  CustomTextFormFieldWidget(
      {super.key,
      required this.hideText,
      required this.controllerName,
      required this.textName,
      TextInputType? textInputType});

  final bool hideText;
  final TextEditingController controllerName;
  final String textName;
  TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'Enter $textName' : null,
      obscureText: hideText,
      controller: controllerName,
      keyboardType: textInputType ?? TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: textName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
