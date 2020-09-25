import 'package:flutter/material.dart';

class PatientSuggestion extends StatefulWidget {
  @override
  _PatientSuggestionState createState() => _PatientSuggestionState();
}

class _PatientSuggestionState extends State<PatientSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestion'),
        backgroundColor: Colors.blue[300],
      ),
      body: Container(),
    );
  }
}
