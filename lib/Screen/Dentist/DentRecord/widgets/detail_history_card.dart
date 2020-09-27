import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/constants.dart';

class DentailHistoryCard extends StatefulWidget {
  @override
  _DentailHistoryCardState createState() => _DentailHistoryCardState();
}

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

class _DentailHistoryCardState extends State<DentailHistoryCard> {
  @override
  void initState() {
    super.initState();
    // readAllData();
    dentailHistoryCard();
  }

  // Future<void> readAllData() async {
  //   Firestore firestore = Firestore.instance;
  //   CollectionReference collectionReference = firestore
  //       .collection('Account')
  //       .document('account')
  //       .collection('Patients')
  //       .document(uid)
  //       .collection('DentalCase');
  //   collectionReference.snapshots().listen((response) {
  //     List<DocumentSnapshot> snapshots = response.documents;
  //     for (var snapshot in snapshots) {
  //       List<String> read1 = List.from(snapshot['tooth 1 Front']);
  //       print(read1);
  //       // if (snapshot.data['tooth 1 Front'] != null) {
  //       tooth1Front = Text('Tooth 1 Front = ${snapshot.data['tooth 1 Front']}')
  //           .toString();
  //       // }
  //       if (snapshot.data['tooth 1 Middle'] != null) {
  //         tooth1Middle =
  //             Text('Tooth 1 Middle = ${snapshot.data['tooth 1 Middle']}')
  //                 .toString();
  //       }
  //       if (snapshot.data['tooth 1 Back'] != null) {
  //         tooth1Back = Text('Tooth 1 Back = ${snapshot.data['tooth 1 Back']}')
  //             .toString();
  //       }
  //     }
  //     Firestore.instance
  //         .collection("Account")
  //         .document('account')
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
      body: SafeArea(
        child: CupertinoButton(
          child: Container(
            height: 80,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.blueGrey),
              // image: DecorationImage(
              //   image:
              //       AssetImage("assets/images/Logo/App-Icon-drop-shadow.jpg"),
              //   fit: BoxFit.cover,
              // ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Case",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Date: 22/09/20",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text('Card is clicked.'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text('ok'),
                    onPressed: () {
                      Navigator.pop(context, 'ok');
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget dentailHistoryCard() {
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
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 1 Front'] != null) {
        tooth1Front = ('${snapshot.data['tooth 1 Front']}');
      }
      if (snapshot.data['tooth 1 Middle'] != null) {
        tooth1Middle =
            Text('Tooth 1 Middle = ${snapshot.data['tooth 1 Middle']}')
                .toString();
      }
      if (snapshot.data['tooth 1 Back'] != null) {
        tooth1Back =
            Text('Tooth 1 Back = ${snapshot.data['tooth 1 Back']}').toString();
      }
    }
  });

  return Container(
    height: 80,
    width: 200,
    decoration: BoxDecoration(
      color: bCardColor.withOpacity(0.6),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Container(
      margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            tooth1Front.toString().substring(1, tooth1Front.length - 1),
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          Text(
            "Date: 22/09/20",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    ),
  );
}

String uid;
void getidtohis(String getidtohis) {
  uid = getidtohis;
}
