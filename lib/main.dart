import 'ui/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      HomeScreen.screenName: (_) =>  const HomeScreen()
    },
    initialRoute: HomeScreen.screenName,
  )
  );
}

