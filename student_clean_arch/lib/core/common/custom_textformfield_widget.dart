import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.hideText,
    required this.controllerName,
    required this.textName,
  });

  final bool hideText;
  final TextEditingController controllerName;
  final String textName;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => value!.isEmpty ? 'Enter $textName' : null,
      obscureText: hideText,
      controller: controllerName,
      decoration: InputDecoration(
        labelText: textName,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
