
import 'dart:io';
import 'package:firstprojetimmw/functions/firestoreHelper.dart';
import 'package:firstprojetimmw/model/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:date_format/date_format.dart';

class myDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return myDrawerState();
  }

}

class myDrawerState extends State<myDrawer>{
  // Variable de la f
  String? identifiant;
  Users? utilisateur;
  DateTime time = DateTime.now();
  //Dateformat dateFormat = Dateformat("fr_FR");


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirestoreHelper().getIdentifiant().then((value){
      setState(() {
        identifiant = value;
      });
      FirestoreHelper().getUser(identifiant!).then((value){
        setState(() {
          utilisateur = value;
        });
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    FirestoreHelper().getIdentifiant().then((value){
      setState(() {
        identifiant = value;
      });
      FirestoreHelper().getUser(identifiant!).then((value){
        setState(() {
          utilisateur = value;
        });
      });
    });
    return Container(
      padding: EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width/2,
      color: Colors.white,
      child:  Column(
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: (utilisateur!.image == null)?NetworkImage("https://firebasestorage.googleapis.com/v0/b/firstprojetimm.appspot.com/o/image_disponible.png?alt=media&token=809cfa6c-b1af-44e1-bd85-a12ae9ef0f39"):NetworkImage(utilisateur!.image!)
              ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("${utilisateur?.pseudo}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              IconButton(
                  onPressed: (){
                        UpdateBox();
                  },
                  icon: Icon(Icons.edit)
              )
            ],
          ),

          SizedBox(height: 10,),
          Row(
            children: [
              Icon(Icons.mail),
              Text("${utilisateur?.mail}"),
            ],
          ),
          SizedBox(height: 10,),
          Text("${utilisateur!.prenom}  ${utilisateur!.nom}"),

          SizedBox(height: 10,),
          (utilisateur!.dateNaissance== null)?Text(time.toString()):Text(utilisateur!.dateNaissance!.toString()),





          IconButton(
              onPressed: (){
                FirestoreHelper().logUser();
                //chemein vers page principal
              },
              icon: Icon(Icons.exit_to_app_rounded,)
          ),
         IconButton(
             onPressed: (){
               //Création d'un boite de dialogue
               BoxDelete();

             },
             icon: Icon(Icons.logout,color: Colors.red,)
         ),
        ],

      )

    );
  }

UpdateBox(){
    String update = "";
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Modification"),
            content: TextField(
              onChanged: (newValue){
                setState(() {
                  update = newValue;
                });
              },

            ),
            actions: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text("Annuler")
              ),
              ElevatedButton(
                  onPressed: (){
                    Map<String,dynamic> map = {
                      "PSEUDO":update
                    };
                    FirestoreHelper().updateUser(utilisateur!.id, map);
                    Navigator.pop(context);
                  },
                  child: Text("Enregistrer")
              )
            ],
          );
        }
    );
}
  //Création de la boite de la dialogue
BoxDelete(){
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          if (Platform.isIOS) {
            return CupertinoAlertDialog(
              title: Text("Suppression du compte définitif ?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Non")
                ),
                ElevatedButton(
                    onPressed: () {


                    },
                    child: Text("Oui")
                ),
              ],
            );
          }
          else {
            return AlertDialog(
              title: Text("Suppression du compte définitif ?"),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Non")
                ),
                ElevatedButton(
                    onPressed: () {

                    },
                    child: Text("Oui")
                ),
              ],
            );
          }
        }
    );
}


}