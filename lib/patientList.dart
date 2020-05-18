import 'package:flutter/material.dart';
import 'package:fundee/addPatient.dart';


class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patients')),
    floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AddPatient())),
      child: Text("+"),
    ),
    // body: StreamBuilder(

    // ),
    );
  }
}