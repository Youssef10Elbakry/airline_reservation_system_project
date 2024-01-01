import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../home_screen.dart';

void errorDialog(BuildContext context, String message){
  showDialog(context: context as BuildContext, builder: (_){
    return AlertDialog(
      title: Text("Error"),
      content: Text(message),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Ok"))
      ],
    );
  });
}

void registeredSuccessfullyDialog(BuildContext context){
  showDialog(context: context as BuildContext, builder: (_){
    return AlertDialog(
      title: const Text("You Registered Successfully"),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Ok"))
      ],
    );
  });
}

void confirmSwitching(BuildContext context){
  showDialog(context: context, builder: (_){
    return AlertDialog(
      title: Text("Confirm"),
      content: Text("Are you sure you want to switch"),
      actions: [
        TextButton(onPressed: ()async{
          await FirebaseAuth.instance.signOut();
          Navigator.pushReplacementNamed(context, HomeScreen.screenName);
        }, child: Text("Yes")),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("No")),
      ],
    );
  });
}