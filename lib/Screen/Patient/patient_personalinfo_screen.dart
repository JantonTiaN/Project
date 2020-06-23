import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundee/Screen/signin_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../font_awesome_flutter.dart';
import '../constants.dart';

class PatientPersonalInfoScreen extends StatefulWidget {
  @override
  _PatientPersonalInfoScreenState createState() =>
      _PatientPersonalInfoScreenState();
}

class _PatientPersonalInfoScreenState extends State<PatientPersonalInfoScreen> {
  final drugallergy = TextEditingController();
  final tel = TextEditingController();
  final gender = TextEditingController();
  final databaseReference = Firestore.instance;
  final firestoreInstance = Firestore.instance;
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
          Positioned(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Personal Information',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
          )),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    FontAwesomeIcons.birthdayCake,
                    color: bPrimaryColor,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Birth Date"),
                    controller: tel,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.phone,
                    color: bPrimaryColor,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Phone Number"),
                    controller: tel,
                    keyboardType: TextInputType.phone,
                    inputFormatters: <TextInputFormatter>[
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    FontAwesomeIcons.pills,
                    color: bPrimaryColor,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Drug Allergy"),
                    controller: drugallergy,
                  ),
                )),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              FittedBox(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        // return Text('asdasdasd');
                        return SignInScreen();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: bPrimaryColor,
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(
                            "SIGN UP",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void createRecord() async {
    await databaseReference.collection("patients").document("1").setData(
        {'firstName': drugallergy, 'lastName': 'Programming Guide for Dart'});

    DocumentReference ref = await databaseReference.collection("patients").add({
      'title': 'Flutter in Action',
      'description': 'Complete Programming Guide to learn Flutter'
    });
    print(ref.documentID);
  }
}
