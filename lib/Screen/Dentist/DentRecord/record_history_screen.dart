import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';

class RecordHistoryScreen extends StatefulWidget {
  @override
  _RecordHistoryScreenState createState() => _RecordHistoryScreenState();
}

class _RecordHistoryScreenState extends State<RecordHistoryScreen> {
  List alldata = [];

  @override
  void initState() {
    super.initState();
    // readAllData();
    getClinic();
  }

  // Future<void> readAllData() async {
  //   Firestore.instance
  //       .collection('FunD')
  //       .document('funD')
  //       .collection('Clinic')
  //       .document('clinic')
  //       .collection(clinic)
  //       .document(clinic)
  //       .collection('Patients')
  //       .document(uid)
  //       .collection('History')
  //       .getDocuments()
  //       .then((value) => {
  //             value.documents.forEach((element) {
  //               for (var i = 0; i < element.data['history'].length; i++) {
  //                 data.add(element.data['history']);
  //               }
  //               print(data);
  //             })
  //           });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.blue[300],
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
            .document(uid)
            .collection('History')
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
                    'Oh...',
                    style: TextStyle(
                        fontFamily: 'Kanit',
                        color: Colors.blue[300],
                        fontSize: 25),
                  ),
                  Text(
                    'Patient don\'t have any record',
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
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(snapshot.data.documents[0]
                                .data['history'][index]['date']),
                            subtitle: Text(snapshot.data.documents[0]
                                .data['history'][index]['detail']),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

String uid;
void getuserid(String getuserid) {
  uid = getuserid;
}
