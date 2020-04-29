import 'package:flutter/material.dart';
import 'package:fundee/buttonRecord.dart';
import 'package:fundee/dentalRecord.dart';
import 'package:fundee/recordData.dart';

class DetailDental extends StatelessWidget {
class DetailDental extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dental Charting')),
      body: Center(
  _DetailDentalState createState() => _DetailDentalState();
}

      ),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: Container(
          color: Colors.blue,
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              
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
            child: Icon(Icons.add,color: Colors.blue,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
Widget tooth1() {
}


  Widget tooth1() {
  return Container(
      width: 200,
      height: 200,
      width: 175,
      height: 175,
      child: Image.asset("assets/images/tooth1-1.png"));
}

Widget tooth2() {
  return Container(
      width: 150,
      height: 150,
      width: 175,
      height: 175,
      child: Image.asset("assets/images/tooth1-2.png"));
}

Widget tooth3() {
  return Container(
      width: 200,
      height: 200,
      width: 175,
      height: 175,
      child: Image.asset("assets/images/tooth1-3.png"));

}
}

