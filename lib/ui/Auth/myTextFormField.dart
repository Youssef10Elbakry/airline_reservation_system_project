import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField({super.key, required this.hintText, required this.inputType});
  String hintText;
  TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (text){
        if(inputType == TextInputType.name || inputType == TextInputType.visiblePassword){
          if(text == null || text.isEmpty){
            String shownErrorText = "";
            shownErrorText = inputType == TextInputType.name? "Username can’t be empty" : "Password can’t be empty";
            return shownErrorText;
          }
        }
        else if(inputType == TextInputType.emailAddress){
          if(text == null || text.isEmpty){
            return "Email address can’t be empty";
          }
          if(!(text!.contains("@")) || !(text!.contains(".com"))){
            return "Please enter a valid email";
          }
        }
        else if(inputType == TextInputType.number){
          if(text == null || text.isEmpty){
            return "Age can’t be empty";
          }
          try{
            int.parse(text!);
          }
          catch(e){
            return "You must enter integer number";
          }
          if(int.parse(text!)<18){
            return "You must be 18 years or older to register";
          }
        }
      },
      keyboardType: inputType,
      obscureText: inputType == TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        hintText: hintText
      ),
    );
  }
}
