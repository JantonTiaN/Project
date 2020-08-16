import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PatientInfo extends StatefulWidget {
  final String fullname;
  final String tel;
  PatientInfo({Key key, @required this.fullname, @required this.tel})
      : super(key: key);

  @override
  _PatientInfoState createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  String pnumber = "Loading...เบอร์ไม่ขึ้นน";

  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection("Account")
        .document('account')
        .collection('Patients')
        .document(widget.fullname)
        .get()
        .then((value) {
      setState(() {
        pnumber = value.data['tel'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fullname),
        // backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.fullname,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
            ),
            Text(
              pnumber,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
