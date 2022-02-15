
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstprojetimmw/model/User.dart';

class FirestoreHelper{
  //Attributs
  final auth = FirebaseAuth.instance;
  final fire_user = FirebaseFirestore.instance.collection("Users");



  //Méthode
Future CreationUser({required String? mail, required String? password, String? prenom, String? nom}) async {
  UserCredential authresult = await auth.createUserWithEmailAndPassword(email: mail!, password: password!);
  User? user = authresult.user!;
  String uid = user.uid;
  Map<String,dynamic> map ={
    "PRENOM":prenom,
    "NOM":nom,
    "MAIL":mail,
  };
  addUser(uid, map);

}

Future ConnectUser({required String mail,required String password}) async{
  UserCredential authresult = await auth.signInWithEmailAndPassword(email: mail, password: password);
  User? user = authresult.user!;

}



addUser(String uid, Map<String,dynamic> map){
  fire_user.doc(uid).set(map);
}

updateUser(String uid,Map<String,dynamic> map){
  fire_user.doc(uid).update(map);
}


deleteUser(String uid){
   fire_user.doc(uid).delete();
}

logUser(){
  auth.signOut();
}

Future <String> getIdentifiant() async {
  String uid =  auth.currentUser!.uid;
  return uid;
}

Future <Users> geUser(String uid) async {
  DocumentSnapshot snapshot = await fire_user.doc(uid).get();
  return Users(snapshot);
}


}