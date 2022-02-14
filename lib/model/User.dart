
import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String id = "";
  String? nom;
  String? prenom;
  String? image;
  String? mail;
  String? pseudo;
  DateTime? dateNaissance;




  User(DocumentSnapshot snapshot){
    id = snapshot.id;
    Map<String,dynamic> map = snapshot.data() as Map<String,dynamic>;
    nom = map["NOM"];
    prenom = map ["PRENOM"];
    image = map["IMAGE"];
    mail = map["MAIL"];
    pseudo = map ["PSEUDO"];
    dateNaissance = map ["DATENAISSANCE"];


  }



}