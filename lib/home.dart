import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
