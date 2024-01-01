import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser{
  static String collectionName = "users";
  late String id;
  late String email;
  late String username;
  late int age;

  AppUser({required this.id, required this.username, required this.email, required this.age});
  AppUser.fromJson(Map json){
    id = json["id"];
    email = json["email"];
    username = json["username"];
    age = int.parse(json["age"]);
  }

  Map<String, dynamic> toJson(){
    return{
      "id": id,
      "email": email,
      "username": username,
      "age": age.toString()
    };
  }

  static CollectionReference<AppUser> collection(){
    return FirebaseFirestore.instance.collection(
        AppUser.collectionName).withConverter<AppUser>(
        fromFirestore: (snapshot, _) {
          return AppUser.fromJson(snapshot.data()!);
        }
        , toFirestore: (user, _) {
      return user.toJson();
    });
  }

}