import 'package:firstprojetimmw/view/Mydrawer.dart';
import 'package:flutter/material.dart';

class dashboard extends StatefulWidget{
  String? mail;
  String? password;
  dashboard(String? this.mail,String? this.password);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return dashboardState();
  }

}


class dashboardState extends State<dashboard>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Nouvelle page"),
      ),
      body: bodyPage(),

    );
  }



  Widget bodyPage(){
    return Text("Nouvelle page");
  }

}