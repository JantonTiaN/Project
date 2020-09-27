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
        tooth1Middle = ('${snapshot.data['tooth 1 Middle']}');
      }
      if (snapshot.data['tooth 1 Back'] != null) {
        tooth1Back = ('${snapshot.data['tooth 1 Back']}');
      }
      if (snapshot.data['tooth 2 Front'] != null) {
        tooth2Front = ('${snapshot.data['tooth 2 Front']}');
      }
      if (snapshot.data['tooth 2 Middle'] != null) {
        tooth2Middle = ('${snapshot.data['tooth 2 Middle']}');
      }
      if (snapshot.data['tooth 2 Back'] != null) {
        tooth2Back = ('${snapshot.data['tooth 2 Back']}');
      }
      if (snapshot.data['tooth 3 Front'] != null) {
        tooth3Front = ('${snapshot.data['tooth 3 Front']}');
      }
      if (snapshot.data['tooth 3 Middle'] != null) {
        tooth3Middle = ('${snapshot.data['tooth 3 Middle']}');
      }
      if (snapshot.data['tooth 3 Back'] != null) {
        tooth3Back = ('${snapshot.data['tooth 3 Back']}');
      }
      if (snapshot.data['tooth 4 Front'] != null) {
        tooth4Front = ('${snapshot.data['tooth 4 Front']}');
      }
      if (snapshot.data['tooth 4 Middle'] != null) {
        tooth4Middle = ('${snapshot.data['tooth 4 Middle']}');
      }
      if (snapshot.data['tooth 4 Back'] != null) {
        tooth4Back = ('${snapshot.data['tooth 4 Back']}');
      }
      if (snapshot.data['tooth 5 Front'] != null) {
        tooth5Front = ('${snapshot.data['tooth 5 Front']}');
      }
      if (snapshot.data['tooth 5 Middle'] != null) {
        tooth5Middle = ('${snapshot.data['tooth 5 Middle']}');
      }
      if (snapshot.data['tooth 5 Back'] != null) {
        tooth5Back = ('${snapshot.data['tooth 5 Back']}');
      }
      if (snapshot.data['tooth 6 Front'] != null) {
        tooth6Front = ('${snapshot.data['tooth 6 Front']}');
      }
      if (snapshot.data['tooth 6 Middle'] != null) {
        tooth6Middle = ('${snapshot.data['tooth 6 Middle']}');
      }
      if (snapshot.data['tooth 6 Back'] != null) {
        tooth6Back = ('${snapshot.data['tooth 6 Back']}');
      }
      if (snapshot.data['tooth 7 Front'] != null) {
        tooth7Front = ('${snapshot.data['tooth 7 Front']}');
      }
      if (snapshot.data['tooth 7 Middle'] != null) {
        tooth7Middle = ('${snapshot.data['tooth 7 Middle']}');
      }
      if (snapshot.data['tooth 7 Back'] != null) {
        tooth7Back = ('${snapshot.data['tooth 7 Back']}');
      }
      if (snapshot.data['tooth 8 Front'] != null) {
        tooth8Front = ('${snapshot.data['tooth 8 Front']}');
      }
      if (snapshot.data['tooth 8 Middle'] != null) {
        tooth8Middle = ('${snapshot.data['tooth 8 Middle']}');
      }
      if (snapshot.data['tooth 8 Back'] != null) {
        tooth8Back = ('${snapshot.data['tooth 8 Back']}');
      }
      if (snapshot.data['tooth 9 Front'] != null) {
        tooth9Front = ('${snapshot.data['tooth 9 Front']}');
      }
      if (snapshot.data['tooth 9 Middle'] != null) {
        tooth9Middle = ('${snapshot.data['tooth 9 Middle']}');
      }
      if (snapshot.data['tooth 9 Back'] != null) {
        tooth9Back = ('${snapshot.data['tooth 9 Back']}');
      }
      if (snapshot.data['tooth 10 Front'] != null) {
        tooth10Front = ('${snapshot.data['tooth 10 Front']}');
      }
      if (snapshot.data['tooth 10 Middle'] != null) {
        tooth10Middle = ('${snapshot.data['tooth 10 Middle']}');
      }
      if (snapshot.data['tooth 10 Back'] != null) {
        tooth10Back = ('${snapshot.data['tooth 10 Back']}');
      }
      if (snapshot.data['tooth 11 Front'] != null) {
        tooth11Front = ('${snapshot.data['tooth 11 Front']}');
      }
      if (snapshot.data['tooth 11 Middle'] != null) {
        tooth11Middle = ('${snapshot.data['tooth 11 Middle']}');
      }
      if (snapshot.data['tooth 11 Back'] != null) {
        tooth11Back = ('${snapshot.data['tooth 11 Back']}');
      }
      if (snapshot.data['tooth 12 Front'] != null) {
        tooth12Front = ('${snapshot.data['tooth 12 Front']}');
      }
      if (snapshot.data['tooth 12 Middle'] != null) {
        tooth12Middle = ('${snapshot.data['tooth 12 Middle']}');
      }
      if (snapshot.data['tooth 12 Back'] != null) {
        tooth12Back = ('${snapshot.data['tooth 12 Back']}');
      }
      if (snapshot.data['tooth 13 Front'] != null) {
        tooth13Front = ('${snapshot.data['tooth 13 Front']}');
      }
      if (snapshot.data['tooth 13 Middle'] != null) {
        tooth13Middle = ('${snapshot.data['tooth 13 Middle']}');
      }
      if (snapshot.data['tooth 13 Back'] != null) {
        tooth13Back = ('${snapshot.data['tooth 13 Back']}');
      }
      if (snapshot.data['tooth 14 Front'] != null) {
        tooth14Front = ('${snapshot.data['tooth 14 Front']}');
      }
      if (snapshot.data['tooth 14 Middle'] != null) {
        tooth14Middle = ('${snapshot.data['tooth 14 Middle']}');
      }
      if (snapshot.data['tooth 14 Back'] != null) {
        tooth14Back = ('${snapshot.data['tooth 14 Back']}');
      }
      if (snapshot.data['tooth 15 Front'] != null) {
        tooth15Front = ('${snapshot.data['tooth 15 Front']}');
      }
      if (snapshot.data['tooth 15 Middle'] != null) {
        tooth15Middle = ('${snapshot.data['tooth 15 Middle']}');
      }
      if (snapshot.data['tooth 15 Back'] != null) {
        tooth15Back = ('${snapshot.data['tooth 15 Back']}');
      }
      if (snapshot.data['tooth 16 Front'] != null) {
        tooth16Front = ('${snapshot.data['tooth 16 Front']}');
      }
      if (snapshot.data['tooth 16 Middle'] != null) {
        tooth16Middle = ('${snapshot.data['tooth 16 Middle']}');
      }
      if (snapshot.data['tooth 16 Back'] != null) {
        tooth16Back = ('${snapshot.data['tooth 16 Back']}');
      }
      if (snapshot.data['tooth 17 Front'] != null) {
        tooth17Front = ('${snapshot.data['tooth 17 Front']}');
      }
      if (snapshot.data['tooth 17 Middle'] != null) {
        tooth17Middle = ('${snapshot.data['tooth 17 Middle']}');
      }
      if (snapshot.data['tooth 17 Back'] != null) {
        tooth17Back = ('${snapshot.data['tooth 17 Back']}');
      }
      if (snapshot.data['tooth 18 Front'] != null) {
        tooth18Front = ('${snapshot.data['tooth 18 Front']}');
      }
      if (snapshot.data['tooth 18 Middle'] != null) {
        tooth18Middle = ('${snapshot.data['tooth 18 Middle']}');
      }
      if (snapshot.data['tooth 18 Back'] != null) {
        tooth18Back = ('${snapshot.data['tooth 18 Back']}');
      }
      if (snapshot.data['tooth 19 Front'] != null) {
        tooth19Front = ('${snapshot.data['tooth 19 Front']}');
      }
      if (snapshot.data['tooth 19 Middle'] != null) {
        tooth19Middle = ('${snapshot.data['tooth 19 Middle']}');
      }
      if (snapshot.data['tooth 19 Back'] != null) {
        tooth19Back = ('${snapshot.data['tooth 19 Back']}');
      }
      if (snapshot.data['tooth 20 Front'] != null) {
        tooth20Front = ('${snapshot.data['tooth 20 Front']}');
      }
      if (snapshot.data['tooth 20 Middle'] != null) {
        tooth20Middle = ('${snapshot.data['tooth 20 Middle']}');
      }
      if (snapshot.data['tooth 20 Back'] != null) {
        tooth20Back = ('${snapshot.data['tooth 20 Back']}');
      }
      if (snapshot.data['tooth 21 Front'] != null) {
        tooth21Front = ('${snapshot.data['tooth 21 Front']}');
      }
      if (snapshot.data['tooth 21 Middle'] != null) {
        tooth21Middle = ('${snapshot.data['tooth 21 Middle']}');
      }
      if (snapshot.data['tooth 21 Back'] != null) {
        tooth21Back = ('${snapshot.data['tooth 21 Back']}');
      }
      if (snapshot.data['tooth 22 Front'] != null) {
        tooth22Front = ('${snapshot.data['tooth 22 Front']}');
      }
      if (snapshot.data['tooth 22 Middle'] != null) {
        tooth22Middle = ('${snapshot.data['tooth 22 Middle']}');
      }
      if (snapshot.data['tooth 22 Back'] != null) {
        tooth22Back = ('${snapshot.data['tooth 22 Back']}');
      }
      if (snapshot.data['tooth 23 Front'] != null) {
        tooth23Front = ('${snapshot.data['tooth 23 Front']}');
      }
      if (snapshot.data['tooth 23 Middle'] != null) {
        tooth23Middle = ('${snapshot.data['tooth 23 Middle']}');
      }
      if (snapshot.data['tooth 23 Back'] != null) {
        tooth23Back = ('${snapshot.data['tooth 23 Back']}');
      }
      if (snapshot.data['tooth 24 Front'] != null) {
        tooth24Front = ('${snapshot.data['tooth 24 Front']}');
      }
      if (snapshot.data['tooth 24 Middle'] != null) {
        tooth24Middle = ('${snapshot.data['tooth 24 Middle']}');
      }
      if (snapshot.data['tooth 24 Back'] != null) {
        tooth24Back = ('${snapshot.data['tooth 24 Back']}');
      }
      if (snapshot.data['tooth 25 Front'] != null) {
        tooth25Front = ('${snapshot.data['tooth 25 Front']}');
      }
      if (snapshot.data['tooth 25 Middle'] != null) {
        tooth25Middle = ('${snapshot.data['tooth 25 Middle']}');
      }
      if (snapshot.data['tooth 25 Back'] != null) {
        tooth25Back = ('${snapshot.data['tooth 25 Back']}');
      }
      if (snapshot.data['tooth 26 Front'] != null) {
        tooth26Front = ('${snapshot.data['tooth 26 Front']}');
      }
      if (snapshot.data['tooth 26 Middle'] != null) {
        tooth26Middle = ('${snapshot.data['tooth 26 Middle']}');
      }
      if (snapshot.data['tooth 26 Back'] != null) {
        tooth26Back = ('${snapshot.data['tooth 26 Back']}');
      }
      if (snapshot.data['tooth 27 Front'] != null) {
        tooth27Front = ('${snapshot.data['tooth 27 Front']}');
      }
      if (snapshot.data['tooth 27 Middle'] != null) {
        tooth27Middle = ('${snapshot.data['tooth 27 Middle']}');
      }
      if (snapshot.data['tooth 27 Back'] != null) {
        tooth27Back = ('${snapshot.data['tooth 27 Back']}');
      }
      if (snapshot.data['tooth 28 Front'] != null) {
        tooth28Front = ('${snapshot.data['tooth 28 Front']}');
      }
      if (snapshot.data['tooth 28 Middle'] != null) {
        tooth28Middle = ('${snapshot.data['tooth 28 Middle']}');
      }
      if (snapshot.data['tooth 28 Back'] != null) {
        tooth28Back = ('${snapshot.data['tooth 28 Back']}');
      }
      if (snapshot.data['tooth 29 Front'] != null) {
        tooth29Front = ('${snapshot.data['tooth 29 Front']}');
      }
      if (snapshot.data['tooth 29 Middle'] != null) {
        tooth29Middle = ('${snapshot.data['tooth 29 Middle']}');
      }
      if (snapshot.data['tooth 29 Back'] != null) {
        tooth29Back = ('${snapshot.data['tooth 29 Back']}');
      }
      if (snapshot.data['tooth 30 Front'] != null) {
        tooth30Front = ('${snapshot.data['tooth 30 Front']}');
      }
      if (snapshot.data['tooth 30 Middle'] != null) {
        tooth30Middle = ('${snapshot.data['tooth 30 Middle']}');
      }
      if (snapshot.data['tooth 30 Back'] != null) {
        tooth30Back = ('${snapshot.data['tooth 30 Back']}');
      }
      if (snapshot.data['tooth 31 Front'] != null) {
        tooth31Front = ('${snapshot.data['tooth 31 Front']}');
      }
      if (snapshot.data['tooth 31 Middle'] != null) {
        tooth31Middle = ('${snapshot.data['tooth 31 Middle']}');
      }
      if (snapshot.data['tooth 31 Back'] != null) {
        tooth31Back = ('${snapshot.data['tooth 31 Back']}');
      }
      if (snapshot.data['tooth 32 Front'] != null) {
        tooth32Front = ('${snapshot.data['tooth 32 Front']}');
      }
      if (snapshot.data['tooth 32 Middle'] != null) {
        tooth32Middle = ('${snapshot.data['tooth 32 Middle']}');
      }
      if (snapshot.data['tooth 32 Back'] != null) {
        tooth32Back = ('${snapshot.data['tooth 32 Back']}');
      }
    }
  });

  if (tooth1Front != null) {
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
    );
  } else {
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
              'No Case',
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
    );
  }
}

String uid;
void getidtohis(String getidtohis) {
  uid = getidtohis;
}
