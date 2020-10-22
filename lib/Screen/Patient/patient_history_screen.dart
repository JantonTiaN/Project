import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Patient/patient_menu_screen.dart';

class PatientHistoryScreen extends StatefulWidget {
  final FirebaseUser user;
  PatientHistoryScreen(this.user, {Key key}) : super(key: key);
  @override
  _PatientHistoryScreenState createState() => _PatientHistoryScreenState();
}

class _PatientHistoryScreenState extends State<PatientHistoryScreen> {
  dynamic data;
  @override
  void initState() {
    super.initState();
    getClinic();
    getData();
  }

  Future<dynamic> getData() async {
    final DocumentReference document = Firestore.instance
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(patientClinic)
        .document(patientClinic)
        .collection('Patients')
        .document(widget.user.uid)
        .collection('History')
        .document('history');
    await document.get().then<dynamic>((DocumentSnapshot snapshot) async {
      setState(() {
        data = snapshot.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Firestore firestore = Firestore.instance;
    DocumentReference documentReference = firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(patientClinic)
        .document(patientClinic)
        .collection('Patients')
        .document(widget.user.uid)
        .collection('History')
        .document('history');
    // documentReference.get().then((value) => {data = value.data['history']});
    if (data == null) {
      return Scaffold(
          appBar: AppBar(
            title: Text('Your Dental History'),
            backgroundColor: Colors.blue[300],
            automaticallyImplyLeading: false,
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
                // Text(
                //   data,
                //   style: TextStyle(
                //       fontFamily: 'Kanit',
                //       color: Colors.blue[300],
                //       fontSize: 25),
                // ),
                Text(
                  'You don\'t have history',
                  style: TextStyle(
                      fontFamily: 'Kanit',
                      color: Colors.blue[300],
                      fontSize: 16),
                ),
                // )
              ],
            ),
          ));
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Text('Your Dental History'),
            backgroundColor: Colors.blue[300],
            automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                StreamBuilder(
                  stream: Firestore.instance
                      .collection('FunD')
                      .document('funD')
                      .collection('Clinic')
                      .document('clinic')
                      .collection(patientClinic)
                      .document(patientClinic)
                      .collection('Patients')
                      .document(widget.user.uid)
                      .collection('History')
                      .document('history')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print(snapshot);
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Column(
                            children: <Widget>[
                              CircularProgressIndicator(),
                              Text('Loading...'),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Container(
                                child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(snapshot.data
                                            .documents[index].data["history"]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ));
    }
  }
}
