import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecordHistoryScreen extends StatefulWidget {
  @override
  _RecordHistoryScreenState createState() => _RecordHistoryScreenState();
}

class _RecordHistoryScreenState extends State<RecordHistoryScreen> {
  final List<String> data = [];

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore
        .collection('Account')
        .document('account')
        .collection('Patients')
        .document(id)
        .collection('DentalCase');
    collectionReference.snapshots().listen((response) {
      List<DocumentSnapshot> snapshots = response.documents;
      for (var snapshot in snapshots) {
        List<String> read1 = List.from(snapshot['tooth 1 Front']);
        // List<String> read2 = List.from(snapshot['tooth 7 Front']);
        print(read1);
        // print(read2);
        print('tooth 1 Front = ${snapshot.data['tooth 1 Front']}');
        print('tooth 1 Middle = ${snapshot.data['tooth 1 Middle']}');
        print('tooth 1 Back = ${snapshot.data['tooth 1 Back']}');
        print('tooth 2 Back = ${snapshot.data['tooth 2 Back']}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //   Firestore.instance.collection("users").getDocuments().then((querySnapshot) {
    //   querySnapshot.documents.forEach((result) {
    //     print(result.data);
    //   });
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.blue[300],
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('Account')
            .document('account')
            .collection('Patients')
            .document(id)
            .collection('DentalCase')
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

String id;
void getDocId(String getid) {
  id = getid;
}
