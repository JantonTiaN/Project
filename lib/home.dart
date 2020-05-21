// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundee/dentalRecord.dart';
import 'package:fundee/login.dart';
import 'package:fundee/patientlist.dart';


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
            DrawerHeader(child: Text("Welcome to Fun-D"),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
            ),
            ListTile(
              title: Text("Login"),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
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
            Text("Dental Record"),
           FlatButton(
                child: patient(),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PatientList()))
                    ),
            Text("Patient List"),
          ],

      ),



      // bottomNavigationBar: CurvedNavigationBar(
        
      //   items: <Widget>[
      //     Icon(Icons.home, size: 20, color: Colors.black),
      //     Icon(Icons.calendar_today, size: 20, color: Colors.black),
      //     Icon(Icons.add, size: 20, color: Colors.black),
      //     Icon(Icons.list, size: 20, color: Colors.black),
      //     Icon(Icons.account_circle, size: 20, color: Colors.black),
      //   ],
      //   animationDuration: Duration(milliseconds: 200),
      //   animationCurve: Curves.bounceInOut,
      //   onTap: (index) {
      //     debugPrint("Current Index is $index");
      //   },
      // ),

      )
    );
  }

  Widget record() {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Image.asset("assets/images/ToothLogo.png"),
    );
  }

    Widget patient() {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Image.asset("assets/images/patient.png"),
    );
  }

}
