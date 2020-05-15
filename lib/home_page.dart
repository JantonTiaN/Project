import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
           colors: [
            Colors.blue[900],
            Colors.blue[800],
            Colors.blue[400]
           ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 70),
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                
                children: <Widget>[
                  
                  Text("สวัสดี", style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Kanit'),),
                  SizedBox(height: 10),
                  Text(" วรินทร,", style: TextStyle(color: Colors.white, fontSize: 24, fontFamily: 'Kanit'),),
                ],
              ),
            ),
            SizedBox(height: 35,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
                ),
              )
              ),
              SizedBox(

              )
          ],
        ),
      ),
    );
  }
}