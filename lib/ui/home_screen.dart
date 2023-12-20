import 'package:airline_reservation_system/ui/Auth/Login/login_screen.dart';
import 'package:flutter/material.dart';
import 'Auth/Registeration/registeration_screen.dart';

class HomeScreen extends StatelessWidget {
  static String screenName = "Home Screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
           Row(
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                    width: 300,
                    height: 450,
                    color: const Color(0xff4F718A),
                  ),
                    const Image(image: AssetImage("assets/HomeScreen/airplane.png"))
                  ],
                ),
                const Expanded(
                  child: Image(
                      image: AssetImage("assets/HomeScreen/alot_airplanes.png")
                  ),
                ),
              ],
            ),
          const Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 50),child: Text("Airline", style: TextStyle(fontSize: 43),),),
            ],
          ),
          const Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 50),child: Text("Reservation", style: TextStyle(fontSize: 43),),),
            ],
          ),
          const Row(
            children: [
              Padding(padding: EdgeInsets.only(left: 50),child: Text("System", style: TextStyle(fontSize: 43),),),
            ],
          ),
          SizedBox(height: 50,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, LoginScreen.screenName);
              },
                style: ElevatedButton.styleFrom(primary: Color(0xff4F718A),
                fixedSize: const Size(300, 50),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))

              ),
              child: const Row(
                children: [
                  SizedBox(width: 110,),
                  Text("login", style: TextStyle(fontSize: 20),),
                  SizedBox(width: 50,),
                  Icon(Icons.navigate_next)
                ],
              ),
            ),
          ],),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, RegisterationScreen.screenName);
                },
                style: ElevatedButton.styleFrom(
                    primary: const Color(0xff4F718A),
                    fixedSize: const Size(300, 49),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                child: const Row(
                  children: [
                    SizedBox(width: 110,),
                    Text("sign-up", style: TextStyle(fontSize: 20),),
                    SizedBox(width: 30,),
                    Icon(Icons.navigate_next)
                  ],
                ),
              ),
            ],),
        ],
      ),
    );
  }
}
