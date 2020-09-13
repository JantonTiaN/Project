import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fundee/models/users.dart';

class RecordHistoryScreen extends StatefulWidget {
  @override
  _RecordHistoryScreenState createState() => _RecordHistoryScreenState();
}

class _RecordHistoryScreenState extends State<RecordHistoryScreen> {
  final Firestore _firestore = Firestore.instance;
  @override
  final cases = OurPatients();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('Account')
            .document('account')
            .collection('Patients')
            .document(cases.patientTel)
            .collection('DentalCase')
            .document('dentalCase')
            .collection('tooth')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Loading..."),
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
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(
                                snapshot.data.documents[index].data["tooth"]),
                            // subtitle:t.data.documents[index].documentID),
                          ),
                          //     Text(snapsho
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
