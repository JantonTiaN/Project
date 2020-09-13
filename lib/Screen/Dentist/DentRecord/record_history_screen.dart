import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecordHistoryScreen extends StatefulWidget {
  @override
  _RecordHistoryScreenState createState() => _RecordHistoryScreenState();
}

class _RecordHistoryScreenState extends State<RecordHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("Account")
            .document('account')
            .collection('Patients')
            .orderBy('fullName')
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
                      child: InkWell(
                        // onTap: () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //         builder: (context) => DentalRecord(
                        //           fullname: snapshot
                        //               .data.documents[index].data["fullName"],
                        //           tel:
                        //               snapshot.data.documents[index].documentID,
                        //         ),
                        //       ));
                        // },
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(snapshot
                                  .data.documents[index].data["fullName"]),
                              subtitle: Text(
                                  snapshot.data.documents[index].documentID),
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
    );
  }
}
