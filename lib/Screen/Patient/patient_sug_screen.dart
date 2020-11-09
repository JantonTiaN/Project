import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Patient/patient_menu_screen.dart';
import 'package:fundee/Screen/Patient/suggestion_detail_screen.dart';

class PatientSuggestion extends StatefulWidget {
  final FirebaseUser user;
  PatientSuggestion(this.user, {Key key}) : super(key: key);
  @override
  _PatientSuggestionState createState() => _PatientSuggestionState();
}

class _PatientSuggestionState extends State<PatientSuggestion> {
  bool _loadingSuggestion = true;

  @override
  void initState() {
    super.initState();
    getClinic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestion'),
        backgroundColor: Colors.blue[300],
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('FunD')
            .document('funD')
            .collection('Clinic')
            .document('clinic')
            .collection(clinic)
            .document(clinic)
            .collection('Patients')
            .document(widget.user.uid)
            .collection('Suggestion')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SpinKitChasingDots(
                    color: Colors.blue[100],
                    size: 50,
                  ),
                  Text(
                    'Loading...',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.documents[0].data['suggestion'].length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SuggestionDetailScreen(
                                      suggestion: snapshot.data.documents[0]
                                              .data['suggestion'][index]
                                          ['suggestion'],
                                    )));
                      },
                      child: ListTile(
                        leading: Text('$index'),
                        title: Text(snapshot.data.documents[0]
                            .data['suggestion'][index]['date']),
                        subtitle: Text(snapshot.data.documents[0]
                            .data['suggestion'][index]['dentist']),
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                    )
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
