import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';
import 'package:fundee/Screen/Dentist/patientList.dart';
import 'package:fundee/Services/database.dart';

class DentSuggestionScreen extends StatefulWidget {
  @override
  _DentSuggestionScreenState createState() => _DentSuggestionScreenState();
}

Firestore firestore = Firestore.instance;
DocumentReference sugDocumentReference = firestore
    .collection('FunD')
    .document('funD')
    .collection('Clinic')
    .document('clinic')
    .collection(clinic)
    .document(clinic)
    .collection('Patients')
    .document(uid)
    .collection('Suggestion')
    .document('suggestion');

class _DentSuggestionScreenState extends State<DentSuggestionScreen> {
  TextEditingController _suggestion = TextEditingController();
  void initState() {
    super.initState();
    getDentistName();
    getClinic();
  }

  String dentistName;
  var sug = new List();
  Map<String, String> map;
  getDentistName() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    return dentistName = user.displayName;
  }

  @override
  Widget build(BuildContext context) {
    sugDocumentReference.get().then((value) => {
          if (value.data['suggestion'] != null) {sug = value.data['suggestion']}
        });
    return Scaffold(
        appBar: AppBar(
          title: Text('Suggestion'),
          backgroundColor: Colors.blue[300],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 24.0),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                      decoration: const InputDecoration(
                          fillColor: Colors.black,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey)),
                          // hintText:
                          //     'e.g. Try to brush your teeth at least 2 times a day',
                          labelText: 'Tap to add Suggestion',
                          labelStyle: TextStyle(color: Colors.blue)),
                      maxLines: 10,
                      controller: _suggestion),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      DateTime _dateTime = DateTime.now();
                      sug.add(map = {
                        'suggestion': _suggestion.text,
                        'dentist': dentistName,
                        'date': _dateTime
                            .toString()
                            .substring(0, _dateTime.toString().length - 7),
                      });
                      suggestion(sug, clinic, uid);
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 55),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          // border: Border.all(color: Colors.blueGrey),
                          color: Colors.blue[300]),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "SAVE",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
