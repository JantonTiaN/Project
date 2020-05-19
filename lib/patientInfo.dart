import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PatientInfo extends StatefulWidget {
  final String fname;
  final String lname;
  PatientInfo({Key key, @required this.fname, @required this.lname})
      : super(key: key);

  @override
  _PatientInfoState createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  String lname = "Please wait...";

  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection("Account")
        .document('account')
        .collection('Users')
        .document(widget.fname)
        .get()
        .then((value) {
      setState(() {
        lname = value.data["tel"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fname),
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.fname,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
            ),
            Text(
              lname,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}