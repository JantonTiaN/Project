import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundee/dentalRecord.dart';
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Text("Welcome to FunDee"),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            ),
            ListTile(
              title: Text("Login"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Etc"),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ), 
      body: Container(
        child: Column(
          children: <Widget>[
            FlatButton(
                child: record(),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DentalRecord()))),
            Text("Dental Record")
          ],
        ),
      ),
    );
  }

  Widget record() {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Image.asset("assets/images/ToothLogo.png"),
    );
  }
}
