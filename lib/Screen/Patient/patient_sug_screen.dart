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
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Image.asset(
                  'assets/images/Logo/No-data.png',
                  width: 150,
                  height: 150,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 100),
              // child:
              Text(
                'Oops',
                style: TextStyle(
                    fontFamily: 'Kanit', color: Colors.blue[300], fontSize: 25),
              ),
              Text(
                'You don\'t have suggestion',
                style: TextStyle(
                    fontFamily: 'Kanit', color: Colors.blue[300], fontSize: 16),
              ),
              // )
            ],
          ),
        ));
  }
}
