import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';

class RecordHistoryScreen extends StatefulWidget {
  @override
  _RecordHistoryScreenState createState() => _RecordHistoryScreenState();
}

class _RecordHistoryScreenState extends State<RecordHistoryScreen> {
  final List<String> data = [];

  @override
  void initState() {
    super.initState();
    // readAllData();
    getClinic();
  }

  // Future<void> readAllData() async {
  //   Firestore firestore = Firestore.instance;
  //   CollectionReference collectionReference = firestore
  //       .collection('FunD')
  //       .document('funD')
  //       .collection('Clinic')
  //       .document('clinic')
  //       .collection(clinic)
  //       .document(clinic)
  //       .collection('Patients')
  //       .document(uid)
  //       .collection('History');
  //   collectionReference.snapshots().listen((response) {
  //     List<DocumentSnapshot> snapshots = response.documents;
  //     for (var snapshot in snapshots) {
  //       List<String> read1 = List.from(snapshot['history']);
  //       print(read1);
  //       tooth1Front = Text('history = ${snapshot.data['history']}').toString();
  //     }
  //     Firestore.instance
  //         .collection('FunD')
  //         .document('funD')
  //         .collection('Clinic')
  //         .document('clinic')
  //         .collection(clinic)
  //         .document(clinic)
  //         .collection('Patients')
  //         .document(uid)
  //         .collection('DentalCase')
  //         .getDocuments()
  //         .then((querySnapshot) {
  //       querySnapshot.documents.forEach((result) {
  //         print(result.data);
  //       });
  //     });
  //   });
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
            // print(snapshot.data.runtimeType);
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
                            title: Text(snapshot.data.documents[List(0)]),
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

String uid;
void getuserid(String getuserid) {
  uid = getuserid;
}
