import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Patient/patient_menu_screen.dart';
import 'package:fundee/Screen/Patient/suggestion_detail_screen.dart';

class PatientHistoryScreen extends StatefulWidget {
  final FirebaseUser user;
  PatientHistoryScreen(this.user, {Key key}) : super(key: key);
  @override
  _PatientHistoryScreenState createState() => _PatientHistoryScreenState();
}

class _PatientHistoryScreenState extends State<PatientHistoryScreen> {
  @override
  void initState() {
    super.initState();
    getClinic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your History Record'),
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
            .collection('History')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                    'Oh...',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Colors.blue[300],
                        fontSize: 25),
                  ),
                  Text(
                    'You don\'t have any history',
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
              itemCount: snapshot.data.documents[0].data['history'].length,
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: Text('$index'),
                      title: Text(snapshot.data.documents[0].data['history']
                          [index]['date']),
                      subtitle: Text(snapshot.data.documents[0].data['history']
                          [index]['detail']),
                    ),
                    Text('Responsible by: ' +
                        snapshot.data.documents[0].data['history'][index]
                            ['dentist']),
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
