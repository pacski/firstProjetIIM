
import 'dart:io';
import 'package:firstprojetimmw/functions/firestoreHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return myDrawerState();
  }

}

class myDrawerState extends State<myDrawer>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width/2,
      color: Colors.white,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Mail"),
          Text("Prénom"),
          Text('NOM'),
          Text("Image"),
          Text("Pseudo"),
          Text("Date de naissance"),
          Text("Bouton pour se déconnecter"),
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