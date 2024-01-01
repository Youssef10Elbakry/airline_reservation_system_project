import 'package:airline_reservation_system/model/app_user.dart';
import 'package:airline_reservation_system/ui/Auth/dialogs/Dialogs.dart';
import 'package:airline_reservation_system/ui/main_screen/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../myTextFormField.dart';

class LoginScreen extends StatelessWidget {
  static String screenName = "Login Screen";
  BuildContext? scontext;
  String email = "";
  String password = "";
  List<TextEditingController> controllers = [TextEditingController(), TextEditingController()];
  List hintTexts = ["email address", "Password"];
  List inputTypes = [TextInputType.emailAddress,TextInputType.visiblePassword];
  static final GlobalKey<FormState>  loginFormKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    scontext = context;
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
                          MyTextFormField(hintText: hintTexts[index], inputType: inputTypes[index], controller: controllers[index], ),
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
                          if(isValid){
                            // getText();
                            // login();
                          }
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

  void getText(){
    email = controllers[0].text;
    password = controllers[1].text;
    print("email: $email");
    print("pass: $password");
  }
//
//   void login() async{
//     try {
//       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password
//       );
//       AppUser currentUser = await getUserFromFirestore(credential.user!.uid);
//       print("login successfully");
//       Navigator.pushReplacementNamed(scontext!, MainScreen.screenName);
//     } on FirebaseAuthException catch (e) {
//       errorDialog(scontext!, e.message ?? "Something went wrong. Try again");
//     }
//   }
//
//   Future<AppUser> getUserFromFirestore(String id) async{
//     CollectionReference<AppUser> userCollection = AppUser.collection();
//     DocumentSnapshot<AppUser> documentSnapshot = await userCollection.doc(id).get();
//     return documentSnapshot.data()!;
//   }
}
