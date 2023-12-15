import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({super.key, required this.hintText, required this.inputType});
  String hintText;
  TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      keyboardType: inputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        hintText: hintText
      ),
    );
  }
}
