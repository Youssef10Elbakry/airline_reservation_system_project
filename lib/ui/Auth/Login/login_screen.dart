import 'package:flutter/material.dart';

import '../myTextFormField.dart';

class LoginScreen extends StatelessWidget {
  static String screenName = "Login Screen";
  List hintTexts = ["Username", "Password"];
  List inputTypes = [TextInputType.name,TextInputType.visiblePassword];
  static final GlobalKey<FormState>  loginFormKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: Container(
        decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/Registeration_login/background.png"))),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 100,),
              const Row(
                children: [
                  SizedBox(width: 40,),
                  Text("Login", style: TextStyle(fontSize: 34, color: Colors.white),),
                  SizedBox(width: 150,),
                  Image(image: AssetImage("assets/Registeration_login/takeoff-the-plane 1.png"))
                ],
              ),
              const SizedBox(height: 10,),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.only(top: 5, bottom: 20, left: 20, right: 20),
                  width: 353,
                  height: 416,
                  child:Column(
                    children: [
                      Expanded(child: ListView.builder(itemCount: 2, itemBuilder: (_, index )=>Column(
                        children: [
                          index == 0 ? const SizedBox(height: 20):const SizedBox(height: 40,),
                          MyTextFormField(hintText: hintTexts[index], inputType: inputTypes[index],),
                        ],
                      )
                      )
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        width: 325,
                        height: 53,
                        child: ElevatedButton(onPressed: (){
                          bool isValid = loginFormKey.currentState!.validate();
                          if(isValid){}
                        },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              backgroundColor: const Color(0xff4F718A)),
                          child: const Text("login", style: TextStyle(fontSize: 20),),
                        ),
                      )
                    ],
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}
