import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PatientInfo extends StatefulWidget {
  final String id;
  final String fname;
  PatientInfo({Key key, @required this.id, @required this.fname})
      : super(key: key);

  @override
  _PatientInfoState createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  String fname = "กำลังโหลด...";

  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection("Account")
        .document('account')
        .collection('Users')
        .document(widget.id)
        .get()
        .then((value) {
      setState(() {
        fname = value.data["firstName"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id),
        // backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.id,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
            ),
            Text(
              fname,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}