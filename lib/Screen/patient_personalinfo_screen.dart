import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundee/Screen/signin_screen.dart';
import 'package:fundee/Services/add_patient_service..dart';

import '../font_awesome_flutter.dart';
import 'constants.dart';

class PatientPersonalInfoScreen extends StatefulWidget {
  @override
  _PatientPersonalInfoScreenState createState() => _PatientPersonalInfoScreenState();
}

class _PatientPersonalInfoScreenState extends State<PatientPersonalInfoScreen> {
  final drugallergy = TextEditingController();
  final tel = TextEditingController();
  final gender = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ToothbrushFixed.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Positioned(
              child: Stack(
                children: <Widget>[
                  Positioned(
                      bottom: -10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Welcome to Fun-D',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ))
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}
