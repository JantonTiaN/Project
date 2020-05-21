import 'package:flutter/material.dart';


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
      onPressed: (){},
      child: Text("+"),
    ),
    );
  }
}

// class _ListItem{
//   _ListItem(this.value, this.checked);
//   final String value;
//   bool checked;
// }

