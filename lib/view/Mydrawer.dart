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
          Text("Date de naissance")
        ],

      )

    );
  }

}