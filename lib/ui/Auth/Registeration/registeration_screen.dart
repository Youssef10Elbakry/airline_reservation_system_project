
import 'package:airline_reservation_system/model/app_user.dart';
import 'package:airline_reservation_system/ui/Auth/dialogs/Dialogs.dart';
import 'package:airline_reservation_system/ui/Auth/myTextFormField.dart';
import 'package:airline_reservation_system/ui/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterationScreen extends StatelessWidget {
  static String screenName = "Registration Screen";
  BuildContext ? scontext;
  String email = "";
  String password = "";
  String username = "";
  int age = 0;
  List<TextEditingController> controllers = [TextEditingController(), TextEditingController(), TextEditingController(), TextEditingController()];
  List hintTexts = ["Username", "Email", "Password", "Age"];
  List inputTypes = [TextInputType.name, TextInputType.emailAddress, TextInputType.visiblePassword, TextInputType.number];
  static final GlobalKey<FormState>  regFormKey = GlobalKey<FormState>();
  RegisterationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    scontext = context;
    return Form(
      key: regFormKey,
      child: Container(
        decoration: const BoxDecoration(image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/Registeration_login/background.png"))),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 100,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Registeration", style: TextStyle(fontSize: 34, color: Colors.white),),
                  SizedBox(width: 50,),
                  Image(image: AssetImage("assets/Registeration_login/takeoff-the-plane 1.png"))
                ],
              ),
              const SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                padding: const EdgeInsets.only(top: 5, bottom: 20, left: 20, right: 20),
                width: 353,
                height: 444,
                child:Column(
                  children: [
                    Expanded(child: ListView.builder(itemCount: 4, itemBuilder: (_, index )=>Column(
                      children: [
                        index == 0 ?const SizedBox(height: 0,) : const SizedBox(height: 15,),
                        MyTextFormField(hintText: hintTexts[index], inputType: inputTypes[index], controller: controllers[index] ,),
                      ],
                    ))),
                    const SizedBox(height: 20,),
                    SizedBox(
                      width: 325,
                      height: 53,
                      child: ElevatedButton(onPressed: (){
                        bool isValid = regFormKey.currentState!.validate();
                        if(isValid){
                          getText();
                          register();
                        }
                      },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          ),
                            backgroundColor: const Color(0xff4F718A)),
                          child: const Text("create account", style: TextStyle(fontSize: 20),),
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

  void register()async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppUser user = AppUser(id: credential.user!.uid, username: username, email: email, age: age);
      await regiserUserInFirestore(user);
      Navigator.pushReplacementNamed(scontext!, HomeScreen.screenName);
    } on FirebaseAuthException catch (e) {
      errorDialog(scontext!, e.message?? "Something went wrong. Try Agian");
    } catch (e) {
      print(e);
    }
  }

  void getText() {
    username = controllers[0].text;
    print("name: $username");
    email = controllers[1].text;
    print("email: $email");
    password = controllers[2].text;
    print("pass: $password");
    age = int.parse(controllers[3].text);
    print("age: $age");
  }

  Future regiserUserInFirestore(AppUser user)async {
    CollectionReference userCollection = AppUser.collection();
    await userCollection.doc(user.id).set(user);
  }
}
