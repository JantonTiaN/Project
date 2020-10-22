import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentalRecord.dart';

class DentSuggestionScreen extends StatefulWidget {
  @override
  _DentSuggestionScreenState createState() => _DentSuggestionScreenState();
}

class _DentSuggestionScreenState extends State<DentSuggestionScreen> {
  TextEditingController suggestion = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                      decoration: const InputDecoration(
                          fillColor: Colors.black,
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          hintText: 'Suggestion to patient',
                          labelText: 'Suggestion'),
                      maxLines: 10,
                      controller: suggestion),
                ),
                FittedBox(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Firestore firestore = Firestore.instance;
                      firestore
                          .collection('FunD')
                          .document('funD')
                          .collection('Clinic')
                          .document('clinic')
                          .collection(clinic)
                          .document(clinic)
                          .collection('Patients')
                          .document(uid)
                          .collection('Suggestion')
                          .document('suggestion')
                          .updateData({'suggestion': suggestion.text});
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 55),
                      padding:
                          EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(color: Colors.blueGrey),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "SAVE",
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.black),
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

String uid;
void suggestionuid(String suggestionuid) {
  uid = suggestionuid;
}
