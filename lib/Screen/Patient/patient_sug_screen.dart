import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Patient/patient_menu_screen.dart';

class PatientSuggestion extends StatefulWidget {
  final FirebaseUser user;
  PatientSuggestion(this.user, {Key key}) : super(key: key);
  @override
  _PatientSuggestionState createState() => _PatientSuggestionState();
}

class _PatientSuggestionState extends State<PatientSuggestion> {
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
          if (snapshot.connectionState == ConnectionState.waiting) {
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
          } else if (snapshot.data.documents[0].data.length == 0) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/images/Logo/No-data.png',
                    width: 150,
                    height: 150,
                  ),
                  Text(
                    '0 note(s) found',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Colors.blue[300],
                        fontSize: 16),
                  ),
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data.documents[0].data['suggestion'].length,
              itemBuilder: (context, index) {
                final idx = index + 1;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                '   $idx ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                                  .data['suggestion'][index]
                                              ['date']),
                                        Text(
                                        snapshot.data.documents[0]
                                                    .data['suggestion'][index]
                                                ['suggestion'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 5,
                                        style: TextStyle(color: Colors.blue)),
                                      
                                      Text('Recorded by: ' +
                                          snapshot.data.documents[0]
                                                  .data['suggestion'][index]
                                              ['dentist']),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                    // ListTile(
                    //   leading: Text('$idx'),
                    //   title: Text(snapshot.data.documents[0].data['suggestion']
                    //       [index]['date']),
                    //   subtitle: Text(snapshot.data.documents[0]
                    //       .data['suggestion'][index]['suggestion']),
                    // ),
                    // Text('Recorded by: ' +
                    //     snapshot.data.documents[0].data['suggestion'][index]
                    //         ['dentist']),
                    // Divider(
                    //   color: Colors.blueGrey,
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
