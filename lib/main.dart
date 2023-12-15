import 'ui/home_screen.dart';
import 'ui/Auth/Registeration/registeration_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      HomeScreen.screenName: (_) =>  const HomeScreen(),
      RegisterationScreen.screenName: (_) => RegisterationScreen()
    },
    initialRoute: HomeScreen.screenName,
  )
  );
}

