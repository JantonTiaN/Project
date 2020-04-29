import 'package:flutter/material.dart';
import 'package:fundee/buttonRecord.dart';
import 'package:fundee/dentalRecord.dart';
import 'package:fundee/recordData.dart';

class DetailDental extends StatefulWidget {
  @override
  _DetailDentalState createState() => _DetailDentalState();
}

class _DetailDentalState extends State<DetailDental> {
  bool active = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Dental charting"),),
    body: Container(      
      child: Stack(
      children: <Widget>[
        Column(
        children: <Widget>[
          tooth1(),tooth2(),tooth3(),          
          ButtonRecord(
            color: Colors.blue,
            label: "Add Record",
            onTap: (){
              setState(() {
                active = true;
              });
            },
          )
        ],
      ),
      RecordData(
        active: active,
        onTap: (){
          setState(() {
            active = false;
          });
        },
        
      )
      ],
      
    ),      
    )
    );
  }
}


  Widget tooth1() {
  return Container(
      width: 175,
      height: 175,
      child: Image.asset("assets/images/tooth1-1.png"));
}

Widget tooth2() {
  return Container(
      width: 175,
      height: 175,
      child: Image.asset("assets/images/tooth1-2.png"));
}

Widget tooth3() {
  return Container(
      width: 175,
      height: 175,
      child: Image.asset("assets/images/tooth1-3.png"));

}

