import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecordHistoryScreen extends StatefulWidget {
  @override
  _RecordHistoryScreenState createState() => _RecordHistoryScreenState();
}

class _RecordHistoryScreenState extends State<RecordHistoryScreen> {
  final List<String> data = [];
  String tooth1Front,
      tooth2Front,
      tooth3Front,
      tooth4Front,
      tooth5Front,
      tooth6Front,
      tooth7Front,
      tooth8Front,
      tooth9Front,
      tooth10Front,
      tooth11Front,
      tooth12Front,
      tooth13Front,
      tooth14Front,
      tooth15Front,
      tooth16Front,
      tooth17Front,
      tooth18Front,
      tooth19Front,
      tooth20Front,
      tooth21Front,
      tooth22Front,
      tooth23Front,
      tooth24Front,
      tooth25Front,
      tooth26Front,
      tooth27Front,
      tooth28Front,
      tooth29Front,
      tooth30Front,
      tooth31Front,
      tooth32Front;
  String tooth1Middle,
      tooth2Middle,
      tooth3Middle,
      tooth4Middle,
      tooth5Middle,
      tooth6Middle,
      tooth7Middle,
      tooth8Middle,
      tooth9Middle,
      tooth10Middle,
      tooth11Middle,
      tooth12Middle,
      tooth13Middle,
      tooth14Middle,
      tooth15Middle,
      tooth16Middle,
      tooth17Middle,
      tooth18Middle,
      tooth19Middle,
      tooth20Middle,
      tooth21Middle,
      tooth22Middle,
      tooth23Middle,
      tooth24Middle,
      tooth25Middle,
      tooth26Middle,
      tooth27Middle,
      tooth28Middle,
      tooth29Middle,
      tooth30Middle,
      tooth31Middle,
      tooth32Middle;
  String tooth1Back,
      tooth2Back,
      tooth3Back,
      tooth4Back,
      tooth5Back,
      tooth6Back,
      tooth7Back,
      tooth8Back,
      tooth9Back,
      tooth10Back,
      tooth11Back,
      tooth12Back,
      tooth13Back,
      tooth14Back,
      tooth15Back,
      tooth16Back,
      tooth17Back,
      tooth18Back,
      tooth19Back,
      tooth20Back,
      tooth21Back,
      tooth22Back,
      tooth23Back,
      tooth24Back,
      tooth25Back,
      tooth26Back,
      tooth27Back,
      tooth28Back,
      tooth29Back,
      tooth30Back,
      tooth31Back,
      tooth32Back;

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  // tooth1Data() async {
  //   StreamBuilder:
  //   Firestore.instance
  //       .collection("Account")
  //       .document('account')
  //       .collection('Patients')
  //       .document(uid)
  //       .collection('DentalCase')
  //       .getDocuments()
  //       .then((querySnapshot) {
  //     querySnapshot.documents.forEach((result) {
  //       print(result.data);
  //       Map a = (result.data);
  //     });
  //   });
  // }

  Future<void> readAllData() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore
        .collection('Account')
        .document('account')
        .collection('Patients')
        .document(uid)
        .collection('DentalCase');
    collectionReference.snapshots().listen((response) {
      List<DocumentSnapshot> snapshots = response.documents;
      for (var snapshot in snapshots) {
        List<String> read1 = List.from(snapshot['tooth 1 Front']);
        print(read1);
        // if (snapshot.data['tooth 1 Front'] != null) {
        tooth1Front = Text('Tooth 1 Front = ${snapshot.data['tooth 1 Front']}')
            .toString();
        // }
        // if (snapshot.data['tooth 1 Middle'] != null) {
        tooth1Middle =
            Text('Tooth 1 Middle = ${snapshot.data['tooth 1 Middle']}')
                .toString();
        // }
        // if (snapshot.data['tooth 1 Back'] != null) {
        tooth1Back =
            Text('Tooth 1 Back = ${snapshot.data['tooth 1 Back']}').toString();
        // }
      }
      Firestore.instance
          .collection("Account")
          .document('account')
          .collection('Patients')
          .document(uid)
          .collection('DentalCase')
          .getDocuments()
          .then((querySnapshot) {
        querySnapshot.documents.forEach((result) {
          print(result.data);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('History'),
          backgroundColor: Colors.blue[300],
        ),
        body: Column(
          children: [
            ListTile(
              title: Text(tooth1Front.substring(6, tooth1Front.length - 2)),
            )
          ],
        )
        // body: StreamBuilder(
        //   stream: Firestore.instance
        //       .collection('Account')
        //       .document('account')
        //       .collection('Patients')
        //       .document(uid)
        //       .collection('DentalCase')
        //       .snapshots(),
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return Center(
        //         child: Padding(
        //           padding: const EdgeInsets.only(top: 100),
        //           child: Column(
        //             children: <Widget>[
        //               CircularProgressIndicator(),
        //               Text("Loading..."),
        //             ],
        //           ),
        //         ),
        //       );
        //     } else {
        //       return ListView.builder(
        //         itemCount: snapshot.data.documents.length,
        //         itemBuilder: (context, index) {
        //           return Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Card(
        //               child: Container(
        //                 child: Column(
        //                   children: <Widget>[
        //                     ListTile(
        //                       title: Text(snapshot.data.documents[List(0)]),
        //                       // subtitle:t.data.documents[index].documentID),
        //                     ),
        //                     //     Text(snapsho
        //                   ],
        //                 ),
        //               ),
        //             ),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),
        );
  }
}

String uid;
void getuserid(String getuserid) {
  uid = getuserid;
}
