import 'package:airline_reservation_system/ui/Auth/Login/login_screen.dart';
import 'package:airline_reservation_system/ui/main_screen/tabs/main_screen.dart';

import 'ui/home_screen.dart';
import 'ui/Auth/Registeration/registeration_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      HomeScreen.screenName: (_) =>  const HomeScreen(),
      RegisterationScreen.screenName: (_) => RegisterationScreen(),
      LoginScreen.screenName: (_) =>LoginScreen(),
    },
    initialRoute: HomeScreen.screenName,
  )
  );
}

