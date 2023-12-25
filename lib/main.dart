import 'package:airline_reservation_system/ui/Auth/Login/login_screen.dart';
import 'package:airline_reservation_system/ui/main_screen/main_screen.dart';
import 'package:airline_reservation_system/ui/provider/available_tickets_provider.dart';
import 'package:provider/provider.dart';
import 'ui/home_screen.dart';
import 'ui/Auth/Registeration/registeration_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_)=>ATProvider()),
    ],
    child: MaterialApp(
      routes: {
        HomeScreen.screenName: (_) =>  const HomeScreen(),
        RegisterationScreen.screenName: (_) => RegisterationScreen(),
        LoginScreen.screenName: (_) =>LoginScreen(),
        MainScreen.screenName: (_) => MainScreen()
      },
      initialRoute: MainScreen.screenName,
    ),
  )
  );
}

