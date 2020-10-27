import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Dentist/DentRecord/record_history_screen.dart';
import 'package:fundee/Screen/Patient/patient_menu_screen.dart';

class PatientHistoryScreen extends StatefulWidget {
  final FirebaseUser user;
  PatientHistoryScreen(this.user, {Key key}) : super(key: key);
  @override
  _PatientHistoryScreenState createState() => _PatientHistoryScreenState();
}

class _PatientHistoryScreenState extends State<PatientHistoryScreen> {
  Firestore _firestore = Firestore.instance;
  bool _loadingHistory = true;

  // Stream<History> _getHistory() {
  //   Stream<DocumentSnapshot> _history = _firestore
  //       .collection('FunD')
  //       .document('funD')
  //       .collection('Clinic')
  //       .document('clinic')
  //       .collection(clinic)
  //       .document(clinic)
  //       .collection('Patients')
  //       .document(widget.user.uid)
  //       .collection('History')
  //       .document('history')
  //       .snapshots();

  //   setState(() {
  //     _loadingHistory == true;
  //   });

  //   StreamBuilder<DocumentSnapshot>(
  //       stream: _history,
  //       builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
  //         if (snapshot.connectionState == ConnectionState.active) {
  //           var historyData = snapshot.data.data;
  //           var history = historyData['history'];

  //           return ListView.builder(
  //             itemCount: history != null ? history.lenght : 0,
  //             itemBuilder: (context, int index) {
  //               return ListTile(
  //                 title: Text(history[index]['date']),
  //               );
  //             },
  //           );
  //         }
  //       });

  //   setState(() {
  //     _loadingHistory == false;
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _getHistory();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Dental History'),
          backgroundColor: Colors.blue[300],
          automaticallyImplyLeading: false,
        ),
        body: _loadingHistory == false
            ? Container(
                child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitChasingDots(
                      color: Colors.blue[100],
                      size: 50,
                    ),
                    Text(
                      'Loading',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )
                  ],
                ),
              ))
            : Center(
                child: FlatButton(
                color: Colors.amber,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("get Game Record"),
                    StreamBuilder<HistoryRecord>(
                      stream: getHistory(),
                      builder:
                          (BuildContext c, AsyncSnapshot<HistoryRecord> data) {
                        if (data?.data == null) return Text("Error");

                        HistoryRecord h = data.data;

                        return Text("${h.date} + ${h.dentist}");
                      },
                    ),
                  ],
                ),
                onPressed: () {
                  getHistory();
                },
              )));
  }
}

Stream<HistoryRecord> getHistory() {
  return Firestore.instance
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('History')
      .document('history')
      .get()
      .then((snapshot) {
    try {
      return HistoryRecord.fromSnapshot(snapshot);
    } catch (e) {
      print(e);
      return null;
    }
  }).asStream();
}

class HistoryRecord {
  DateTime date;
  String dentist;
  String detail;

  HistoryRecord.fromSnapshot(DocumentSnapshot snapshot)
      : date = snapshot['date'],
        dentist = snapshot['dentist'],
        detail = snapshot['detail'];
}
