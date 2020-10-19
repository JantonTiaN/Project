import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/constants.dart';

class DentailHistoryTooth1Card extends StatefulWidget {
  @override
  _DentailHistoryTooth1CardState createState() =>
      _DentailHistoryTooth1CardState();
}

String clinic;
void getClinicFromDetail(String detailClinic) {
  clinic = detailClinic;
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

class _DentailHistoryTooth1CardState extends State<DentailHistoryTooth1Card> {
  @override
  void initState() {
    super.initState();
    // readAllData();
    dentailHistoryTooth1Card();
    dentailHistoryTooth2Card();
    dentailHistoryTooth3Card();
    dentailHistoryTooth4Card();
    dentailHistoryTooth5Card();
    dentailHistoryTooth6Card();
    dentailHistoryTooth7Card();
    dentailHistoryTooth8Card();
    dentailHistoryTooth9Card();
    dentailHistoryTooth10Card();
    dentailHistoryTooth11Card();
    dentailHistoryTooth12Card();
    dentailHistoryTooth13Card();
    dentailHistoryTooth14Card();
    dentailHistoryTooth15Card();
    dentailHistoryTooth16Card();
    dentailHistoryTooth17Card();
    dentailHistoryTooth18Card();
    dentailHistoryTooth19Card();
    dentailHistoryTooth20Card();
    dentailHistoryTooth21Card();
    dentailHistoryTooth22Card();
    dentailHistoryTooth23Card();
    dentailHistoryTooth24Card();
    dentailHistoryTooth25Card();
    dentailHistoryTooth26Card();
    dentailHistoryTooth27Card();
    dentailHistoryTooth28Card();
    dentailHistoryTooth29Card();
    dentailHistoryTooth30Card();
    dentailHistoryTooth31Card();
    dentailHistoryTooth32Card();
  }

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

dentailHistoryTooth1Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
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
    }
  });

  if (tooth1Front != null) {
    if (tooth1Middle != null) {
      if (tooth1Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth1Front
                          .toString()
                          .substring(1, tooth1Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth1Middle
                          .toString()
                          .substring(1, tooth1Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth1Back.toString().substring(1, tooth1Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth1Front.toString().substring(1, tooth1Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth1Middle
                        .toString()
                        .substring(1, tooth1Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth1Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth1Front.toString().substring(1, tooth1Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth1Back.toString().substring(1, tooth1Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth1Front.toString().substring(1, tooth1Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth1Middle != null) {
    if (tooth1Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth1Middle
                        .toString()
                        .substring(1, tooth1Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth1Back.toString().substring(1, tooth1Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth1Middle
                        .toString()
                        .substring(1, tooth1Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth1Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth1Back.toString().substring(1, tooth1Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth1Front == null || tooth1Middle == null || tooth1Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth2Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 2 Front'] != null) {
        tooth2Front = ('${snapshot.data['tooth 2 Front']}');
      }
      if (snapshot.data['tooth 2 Middle'] != null) {
        tooth2Middle = ('${snapshot.data['tooth 2 Middle']}');
      }
      if (snapshot.data['tooth 2 Back'] != null) {
        tooth2Back = ('${snapshot.data['tooth 2 Back']}');
      }
    }
  });

  if (tooth2Front != null) {
    if (tooth2Middle != null) {
      if (tooth2Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth2Front
                          .toString()
                          .substring(1, tooth2Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth2Middle
                          .toString()
                          .substring(1, tooth2Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth2Back.toString().substring(1, tooth2Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth2Front.toString().substring(1, tooth2Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth2Middle
                        .toString()
                        .substring(1, tooth2Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth2Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth2Front.toString().substring(1, tooth2Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth2Back.toString().substring(1, tooth2Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth2Front.toString().substring(1, tooth2Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth2Middle != null) {
    if (tooth2Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth2Middle
                        .toString()
                        .substring(1, tooth2Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth2Back.toString().substring(1, tooth2Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth2Middle
                        .toString()
                        .substring(1, tooth2Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth2Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth2Back.toString().substring(1, tooth2Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth2Front == null || tooth2Middle == null || tooth2Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth3Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 3 Front'] != null) {
        tooth3Front = ('${snapshot.data['tooth 3 Front']}');
      }
      if (snapshot.data['tooth 3 Middle'] != null) {
        tooth3Middle = ('${snapshot.data['tooth 3 Middle']}');
      }
      if (snapshot.data['tooth 3 Back'] != null) {
        tooth3Back = ('${snapshot.data['tooth 3 Back']}');
      }
    }
  });

  if (tooth3Front != null) {
    if (tooth3Middle != null) {
      if (tooth3Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth3Front
                          .toString()
                          .substring(1, tooth3Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth3Middle
                          .toString()
                          .substring(1, tooth3Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth3Back.toString().substring(1, tooth3Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth3Front.toString().substring(1, tooth3Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth3Middle
                        .toString()
                        .substring(1, tooth3Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth3Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth3Front.toString().substring(1, tooth3Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth3Back.toString().substring(1, tooth3Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth3Front.toString().substring(1, tooth3Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth3Middle != null) {
    if (tooth3Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth3Middle
                        .toString()
                        .substring(1, tooth3Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth3Back.toString().substring(1, tooth3Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth3Middle
                        .toString()
                        .substring(1, tooth3Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth3Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth3Back.toString().substring(1, tooth3Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth3Front == null || tooth3Middle == null || tooth3Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth4Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 4 Front'] != null) {
        tooth4Front = ('${snapshot.data['tooth 4 Front']}');
      }
      if (snapshot.data['tooth 4 Middle'] != null) {
        tooth4Middle = ('${snapshot.data['tooth 4 Middle']}');
      }
      if (snapshot.data['tooth 4 Back'] != null) {
        tooth4Back = ('${snapshot.data['tooth 4 Back']}');
      }
    }
  });

  if (tooth4Front != null) {
    if (tooth4Middle != null) {
      if (tooth4Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth4Front
                          .toString()
                          .substring(1, tooth4Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth4Middle
                          .toString()
                          .substring(1, tooth4Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth4Back.toString().substring(1, tooth4Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth4Front.toString().substring(1, tooth4Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth4Middle
                        .toString()
                        .substring(1, tooth4Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth4Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth4Front.toString().substring(1, tooth4Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth4Back.toString().substring(1, tooth4Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth4Front.toString().substring(1, tooth4Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth4Middle != null) {
    if (tooth4Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth4Middle
                        .toString()
                        .substring(1, tooth4Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth4Back.toString().substring(1, tooth4Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth4Middle
                        .toString()
                        .substring(1, tooth4Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth4Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth4Back.toString().substring(1, tooth4Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth4Front == null || tooth4Middle == null || tooth4Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth5Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 5 Front'] != null) {
        tooth5Front = ('${snapshot.data['tooth 5 Front']}');
      }
      if (snapshot.data['tooth 5 Middle'] != null) {
        tooth5Middle = ('${snapshot.data['tooth 5 Middle']}');
      }
      if (snapshot.data['tooth 5 Back'] != null) {
        tooth5Back = ('${snapshot.data['tooth 5 Back']}');
      }
    }
  });

  if (tooth5Front != null) {
    if (tooth5Middle != null) {
      if (tooth5Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth5Front
                          .toString()
                          .substring(1, tooth5Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth5Middle
                          .toString()
                          .substring(1, tooth5Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth5Back.toString().substring(1, tooth5Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth5Front.toString().substring(1, tooth5Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth5Middle
                        .toString()
                        .substring(1, tooth5Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth5Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth5Front.toString().substring(1, tooth5Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth5Back.toString().substring(1, tooth5Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth5Front.toString().substring(1, tooth5Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth5Middle != null) {
    if (tooth5Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth5Middle
                        .toString()
                        .substring(1, tooth5Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth5Back.toString().substring(1, tooth5Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth5Middle
                        .toString()
                        .substring(1, tooth5Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth5Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth5Back.toString().substring(1, tooth5Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth5Front == null || tooth5Middle == null || tooth5Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth6Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 6 Front'] != null) {
        tooth6Front = ('${snapshot.data['tooth 6 Front']}');
      }
      if (snapshot.data['tooth 6 Middle'] != null) {
        tooth6Middle = ('${snapshot.data['tooth 6 Middle']}');
      }
      if (snapshot.data['tooth 6 Back'] != null) {
        tooth6Back = ('${snapshot.data['tooth 6 Back']}');
      }
    }
  });

  if (tooth6Front != null) {
    if (tooth6Middle != null) {
      if (tooth6Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth6Front
                          .toString()
                          .substring(1, tooth6Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth6Middle
                          .toString()
                          .substring(1, tooth6Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth6Back.toString().substring(1, tooth6Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth6Front.toString().substring(1, tooth6Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth6Middle
                        .toString()
                        .substring(1, tooth6Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth6Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth6Front.toString().substring(1, tooth6Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth6Back.toString().substring(1, tooth6Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth6Front.toString().substring(1, tooth6Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth6Middle != null) {
    if (tooth6Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth6Middle
                        .toString()
                        .substring(1, tooth6Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth6Back.toString().substring(1, tooth6Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth6Middle
                        .toString()
                        .substring(1, tooth6Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth6Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth6Back.toString().substring(1, tooth6Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth6Front == null || tooth6Middle == null || tooth6Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth7Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 7 Front'] != null) {
        tooth7Front = ('${snapshot.data['tooth 7 Front']}');
      }
      if (snapshot.data['tooth 7 Middle'] != null) {
        tooth7Middle = ('${snapshot.data['tooth 7 Middle']}');
      }
      if (snapshot.data['tooth 7 Back'] != null) {
        tooth7Back = ('${snapshot.data['tooth 7 Back']}');
      }
    }
  });

  if (tooth7Front != null) {
    if (tooth7Middle != null) {
      if (tooth7Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth7Front
                          .toString()
                          .substring(1, tooth7Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth7Middle
                          .toString()
                          .substring(1, tooth7Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth7Back.toString().substring(1, tooth7Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth7Front.toString().substring(1, tooth7Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth7Middle
                        .toString()
                        .substring(1, tooth7Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth7Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth7Front.toString().substring(1, tooth7Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth7Back.toString().substring(1, tooth7Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth7Front.toString().substring(1, tooth7Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth7Middle != null) {
    if (tooth7Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth7Middle
                        .toString()
                        .substring(1, tooth7Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth7Back.toString().substring(1, tooth7Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth7Middle
                        .toString()
                        .substring(1, tooth7Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth7Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth7Back.toString().substring(1, tooth7Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth7Front == null || tooth7Middle == null || tooth7Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth8Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 8 Front'] != null) {
        tooth8Front = ('${snapshot.data['tooth 8 Front']}');
      }
      if (snapshot.data['tooth 8 Middle'] != null) {
        tooth8Middle = ('${snapshot.data['tooth 8 Middle']}');
      }
      if (snapshot.data['tooth 8 Back'] != null) {
        tooth8Back = ('${snapshot.data['tooth 8 Back']}');
      }
    }
  });

  if (tooth8Front != null) {
    if (tooth8Middle != null) {
      if (tooth8Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth8Front
                          .toString()
                          .substring(1, tooth8Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth8Middle
                          .toString()
                          .substring(1, tooth8Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth8Back.toString().substring(1, tooth8Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth8Front.toString().substring(1, tooth8Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth8Middle
                        .toString()
                        .substring(1, tooth8Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth8Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth8Front.toString().substring(1, tooth8Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth8Back.toString().substring(1, tooth8Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth8Front.toString().substring(1, tooth8Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth8Middle != null) {
    if (tooth8Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth8Middle
                        .toString()
                        .substring(1, tooth8Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth8Back.toString().substring(1, tooth8Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth8Middle
                        .toString()
                        .substring(1, tooth8Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth8Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth8Back.toString().substring(1, tooth8Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth8Front == null || tooth8Middle == null || tooth8Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth9Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 9 Front'] != null) {
        tooth9Front = ('${snapshot.data['tooth 9 Front']}');
      }
      if (snapshot.data['tooth 9 Middle'] != null) {
        tooth9Middle = ('${snapshot.data['tooth 9 Middle']}');
      }
      if (snapshot.data['tooth 9 Back'] != null) {
        tooth9Back = ('${snapshot.data['tooth 9 Back']}');
      }
    }
  });

  if (tooth9Front != null) {
    if (tooth9Middle != null) {
      if (tooth9Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth9Front
                          .toString()
                          .substring(1, tooth9Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth9Middle
                          .toString()
                          .substring(1, tooth9Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth9Back.toString().substring(1, tooth9Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth9Front.toString().substring(1, tooth9Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth9Middle
                        .toString()
                        .substring(1, tooth9Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth9Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth9Front.toString().substring(1, tooth9Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth9Back.toString().substring(1, tooth9Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth9Front.toString().substring(1, tooth9Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth9Middle != null) {
    if (tooth9Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth9Middle
                        .toString()
                        .substring(1, tooth9Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth9Back.toString().substring(1, tooth9Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth9Middle
                        .toString()
                        .substring(1, tooth9Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth9Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth9Back.toString().substring(1, tooth9Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth9Front == null || tooth9Middle == null || tooth9Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth10Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 10 Front'] != null) {
        tooth10Front = ('${snapshot.data['tooth 10 Front']}');
      }
      if (snapshot.data['tooth 10 Middle'] != null) {
        tooth10Middle = ('${snapshot.data['tooth 10 Middle']}');
      }
      if (snapshot.data['tooth 10 Back'] != null) {
        tooth10Back = ('${snapshot.data['tooth 10 Back']}');
      }
    }
  });

  if (tooth10Front != null) {
    if (tooth10Middle != null) {
      if (tooth10Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth10Front
                          .toString()
                          .substring(1, tooth10Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth10Middle
                          .toString()
                          .substring(1, tooth10Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth10Back
                          .toString()
                          .substring(1, tooth10Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth10Front
                        .toString()
                        .substring(1, tooth10Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth10Middle
                        .toString()
                        .substring(1, tooth10Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth10Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth10Front
                        .toString()
                        .substring(1, tooth10Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth10Back.toString().substring(1, tooth10Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth10Front
                        .toString()
                        .substring(1, tooth10Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth10Middle != null) {
    if (tooth10Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth10Middle
                        .toString()
                        .substring(1, tooth10Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth10Back.toString().substring(1, tooth10Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth10Middle
                        .toString()
                        .substring(1, tooth10Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth10Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth10Back.toString().substring(1, tooth10Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth10Front == null || tooth10Middle == null || tooth10Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth11Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 11 Front'] != null) {
        tooth11Front = ('${snapshot.data['tooth 11 Front']}');
      }
      if (snapshot.data['tooth 11 Middle'] != null) {
        tooth11Middle = ('${snapshot.data['tooth 11 Middle']}');
      }
      if (snapshot.data['tooth 11 Back'] != null) {
        tooth11Back = ('${snapshot.data['tooth 11 Back']}');
      }
    }
  });

  if (tooth11Front != null) {
    if (tooth11Middle != null) {
      if (tooth11Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth11Front
                          .toString()
                          .substring(1, tooth11Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth11Middle
                          .toString()
                          .substring(1, tooth11Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth11Back
                          .toString()
                          .substring(1, tooth11Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth11Front
                        .toString()
                        .substring(1, tooth11Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth11Middle
                        .toString()
                        .substring(1, tooth11Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth11Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth11Front
                        .toString()
                        .substring(1, tooth11Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth11Back.toString().substring(1, tooth11Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth11Front
                        .toString()
                        .substring(1, tooth11Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth11Middle != null) {
    if (tooth11Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth11Middle
                        .toString()
                        .substring(1, tooth11Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth11Back.toString().substring(1, tooth11Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth11Middle
                        .toString()
                        .substring(1, tooth11Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth11Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth11Back.toString().substring(1, tooth11Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth11Front == null || tooth11Middle == null || tooth11Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth12Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 12 Front'] != null) {
        tooth12Front = ('${snapshot.data['tooth 12 Front']}');
      }
      if (snapshot.data['tooth 12 Middle'] != null) {
        tooth12Middle = ('${snapshot.data['tooth 12 Middle']}');
      }
      if (snapshot.data['tooth 12 Back'] != null) {
        tooth12Back = ('${snapshot.data['tooth 12 Back']}');
      }
    }
  });

  if (tooth12Front != null) {
    if (tooth12Middle != null) {
      if (tooth12Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth12Front
                          .toString()
                          .substring(1, tooth12Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth12Middle
                          .toString()
                          .substring(1, tooth12Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth12Back
                          .toString()
                          .substring(1, tooth12Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth12Front
                        .toString()
                        .substring(1, tooth12Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth12Middle
                        .toString()
                        .substring(1, tooth12Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth12Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth12Front
                        .toString()
                        .substring(1, tooth12Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth12Back.toString().substring(1, tooth12Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth12Front
                        .toString()
                        .substring(1, tooth12Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth12Middle != null) {
    if (tooth12Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth12Middle
                        .toString()
                        .substring(1, tooth12Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth12Back.toString().substring(1, tooth12Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth12Middle
                        .toString()
                        .substring(1, tooth12Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth12Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth12Back.toString().substring(1, tooth12Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth12Front == null || tooth12Middle == null || tooth12Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth13Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 13 Front'] != null) {
        tooth13Front = ('${snapshot.data['tooth 13 Front']}');
      }
      if (snapshot.data['tooth 13 Middle'] != null) {
        tooth13Middle = ('${snapshot.data['tooth 13 Middle']}');
      }
      if (snapshot.data['tooth 13 Back'] != null) {
        tooth13Back = ('${snapshot.data['tooth 13 Back']}');
      }
    }
  });

  if (tooth13Front != null) {
    if (tooth13Middle != null) {
      if (tooth13Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth13Front
                          .toString()
                          .substring(1, tooth13Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth13Middle
                          .toString()
                          .substring(1, tooth13Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth13Back
                          .toString()
                          .substring(1, tooth13Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth13Front
                        .toString()
                        .substring(1, tooth13Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth13Middle
                        .toString()
                        .substring(1, tooth13Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth13Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth13Front
                        .toString()
                        .substring(1, tooth13Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth13Back.toString().substring(1, tooth13Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth13Front
                        .toString()
                        .substring(1, tooth13Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth13Middle != null) {
    if (tooth13Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth13Middle
                        .toString()
                        .substring(1, tooth13Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth13Back.toString().substring(1, tooth13Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth13Middle
                        .toString()
                        .substring(1, tooth13Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth13Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth13Back.toString().substring(1, tooth13Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth13Front == null || tooth13Middle == null || tooth13Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth14Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 14 Front'] != null) {
        tooth14Front = ('${snapshot.data['tooth 14 Front']}');
      }
      if (snapshot.data['tooth 14 Middle'] != null) {
        tooth14Middle = ('${snapshot.data['tooth 14 Middle']}');
      }
      if (snapshot.data['tooth 14 Back'] != null) {
        tooth14Back = ('${snapshot.data['tooth 14 Back']}');
      }
    }
  });

  if (tooth14Front != null) {
    if (tooth14Middle != null) {
      if (tooth14Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth14Front
                          .toString()
                          .substring(1, tooth14Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth14Middle
                          .toString()
                          .substring(1, tooth14Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth14Back
                          .toString()
                          .substring(1, tooth14Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth14Front
                        .toString()
                        .substring(1, tooth14Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth14Middle
                        .toString()
                        .substring(1, tooth14Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth14Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth14Front
                        .toString()
                        .substring(1, tooth14Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth14Back.toString().substring(1, tooth14Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth14Front
                        .toString()
                        .substring(1, tooth14Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth14Middle != null) {
    if (tooth14Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth14Middle
                        .toString()
                        .substring(1, tooth14Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth14Back.toString().substring(1, tooth14Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth14Middle
                        .toString()
                        .substring(1, tooth14Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth14Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth14Back.toString().substring(1, tooth14Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth14Front == null || tooth14Middle == null || tooth14Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth15Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 15 Front'] != null) {
        tooth15Front = ('${snapshot.data['tooth 15 Front']}');
      }
      if (snapshot.data['tooth 15 Middle'] != null) {
        tooth15Middle = ('${snapshot.data['tooth 15 Middle']}');
      }
      if (snapshot.data['tooth 15 Back'] != null) {
        tooth15Back = ('${snapshot.data['tooth 15 Back']}');
      }
    }
  });

  if (tooth15Front != null) {
    if (tooth15Middle != null) {
      if (tooth15Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth15Front
                          .toString()
                          .substring(1, tooth15Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth15Middle
                          .toString()
                          .substring(1, tooth15Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth15Back
                          .toString()
                          .substring(1, tooth15Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth15Front
                        .toString()
                        .substring(1, tooth15Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth15Middle
                        .toString()
                        .substring(1, tooth15Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth15Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth15Front
                        .toString()
                        .substring(1, tooth15Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth15Back.toString().substring(1, tooth15Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth15Front
                        .toString()
                        .substring(1, tooth15Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth15Middle != null) {
    if (tooth15Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth15Middle
                        .toString()
                        .substring(1, tooth15Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth15Back.toString().substring(1, tooth15Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth15Middle
                        .toString()
                        .substring(1, tooth15Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth15Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth15Back.toString().substring(1, tooth15Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth15Front == null || tooth15Middle == null || tooth15Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth16Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 16 Front'] != null) {
        tooth16Front = ('${snapshot.data['tooth 16 Front']}');
      }
      if (snapshot.data['tooth 16 Middle'] != null) {
        tooth16Middle = ('${snapshot.data['tooth 16 Middle']}');
      }
      if (snapshot.data['tooth 16 Back'] != null) {
        tooth16Back = ('${snapshot.data['tooth 16 Back']}');
      }
    }
  });

  if (tooth16Front != null) {
    if (tooth16Middle != null) {
      if (tooth16Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth16Front
                          .toString()
                          .substring(1, tooth16Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth16Middle
                          .toString()
                          .substring(1, tooth16Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth16Back
                          .toString()
                          .substring(1, tooth16Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth16Front
                        .toString()
                        .substring(1, tooth16Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth16Middle
                        .toString()
                        .substring(1, tooth16Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth16Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth16Front
                        .toString()
                        .substring(1, tooth16Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth16Back.toString().substring(1, tooth16Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth16Front
                        .toString()
                        .substring(1, tooth16Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth16Middle != null) {
    if (tooth16Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth16Middle
                        .toString()
                        .substring(1, tooth16Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth16Back.toString().substring(1, tooth16Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth16Middle
                        .toString()
                        .substring(1, tooth16Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth16Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth16Back.toString().substring(1, tooth16Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth16Front == null || tooth16Middle == null || tooth16Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth17Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 17 Front'] != null) {
        tooth17Front = ('${snapshot.data['tooth 17 Front']}');
      }
      if (snapshot.data['tooth 17 Middle'] != null) {
        tooth17Middle = ('${snapshot.data['tooth 17 Middle']}');
      }
      if (snapshot.data['tooth 17 Back'] != null) {
        tooth17Back = ('${snapshot.data['tooth 17 Back']}');
      }
    }
  });

  if (tooth17Front != null) {
    if (tooth17Middle != null) {
      if (tooth17Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth17Front
                          .toString()
                          .substring(1, tooth17Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth17Middle
                          .toString()
                          .substring(1, tooth17Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth17Back
                          .toString()
                          .substring(1, tooth17Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth17Front
                        .toString()
                        .substring(1, tooth17Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth17Middle
                        .toString()
                        .substring(1, tooth17Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth17Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth17Front
                        .toString()
                        .substring(1, tooth17Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth17Back.toString().substring(1, tooth17Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth17Front
                        .toString()
                        .substring(1, tooth17Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth17Middle != null) {
    if (tooth17Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth17Middle
                        .toString()
                        .substring(1, tooth17Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth17Back.toString().substring(1, tooth17Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth17Middle
                        .toString()
                        .substring(1, tooth17Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth17Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth17Back.toString().substring(1, tooth17Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth17Front == null || tooth17Middle == null || tooth17Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth18Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 18 Front'] != null) {
        tooth18Front = ('${snapshot.data['tooth 18 Front']}');
      }
      if (snapshot.data['tooth 18 Middle'] != null) {
        tooth18Middle = ('${snapshot.data['tooth 18 Middle']}');
      }
      if (snapshot.data['tooth 18 Back'] != null) {
        tooth18Back = ('${snapshot.data['tooth 18 Back']}');
      }
    }
  });

  if (tooth18Front != null) {
    if (tooth18Middle != null) {
      if (tooth18Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth18Front
                          .toString()
                          .substring(1, tooth18Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth18Middle
                          .toString()
                          .substring(1, tooth18Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth18Back
                          .toString()
                          .substring(1, tooth18Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth18Front
                        .toString()
                        .substring(1, tooth18Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth18Middle
                        .toString()
                        .substring(1, tooth18Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth18Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth18Front
                        .toString()
                        .substring(1, tooth18Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth18Back.toString().substring(1, tooth18Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth18Front
                        .toString()
                        .substring(1, tooth18Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth18Middle != null) {
    if (tooth18Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth18Middle
                        .toString()
                        .substring(1, tooth18Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth18Back.toString().substring(1, tooth18Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth18Middle
                        .toString()
                        .substring(1, tooth18Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth18Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth18Back.toString().substring(1, tooth18Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth18Front == null || tooth18Middle == null || tooth18Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth19Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 19 Front'] != null) {
        tooth19Front = ('${snapshot.data['tooth 19 Front']}');
      }
      if (snapshot.data['tooth 19 Middle'] != null) {
        tooth19Middle = ('${snapshot.data['tooth 19 Middle']}');
      }
      if (snapshot.data['tooth 19 Back'] != null) {
        tooth19Back = ('${snapshot.data['tooth 19 Back']}');
      }
    }
  });

  if (tooth19Front != null) {
    if (tooth19Middle != null) {
      if (tooth19Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth19Front
                          .toString()
                          .substring(1, tooth19Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth19Middle
                          .toString()
                          .substring(1, tooth19Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth19Back
                          .toString()
                          .substring(1, tooth19Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth19Front
                        .toString()
                        .substring(1, tooth19Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth19Middle
                        .toString()
                        .substring(1, tooth19Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth19Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth19Front
                        .toString()
                        .substring(1, tooth19Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth19Back.toString().substring(1, tooth19Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth19Front
                        .toString()
                        .substring(1, tooth19Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth19Middle != null) {
    if (tooth19Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth19Middle
                        .toString()
                        .substring(1, tooth19Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth19Back.toString().substring(1, tooth19Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth19Middle
                        .toString()
                        .substring(1, tooth19Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth19Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth19Back.toString().substring(1, tooth19Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth19Front == null || tooth19Middle == null || tooth19Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth20Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 20 Front'] != null) {
        tooth20Front = ('${snapshot.data['tooth 20 Front']}');
      }
      if (snapshot.data['tooth 20 Middle'] != null) {
        tooth20Middle = ('${snapshot.data['tooth 20 Middle']}');
      }
      if (snapshot.data['tooth 20 Back'] != null) {
        tooth20Back = ('${snapshot.data['tooth 20 Back']}');
      }
    }
  });

  if (tooth20Front != null) {
    if (tooth20Middle != null) {
      if (tooth20Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth20Front
                          .toString()
                          .substring(1, tooth20Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth20Middle
                          .toString()
                          .substring(1, tooth20Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth20Back
                          .toString()
                          .substring(1, tooth20Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth20Front
                        .toString()
                        .substring(1, tooth20Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth20Middle
                        .toString()
                        .substring(1, tooth20Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth20Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth20Front
                        .toString()
                        .substring(1, tooth20Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth20Back.toString().substring(1, tooth20Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth20Front
                        .toString()
                        .substring(1, tooth20Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth20Middle != null) {
    if (tooth20Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth20Middle
                        .toString()
                        .substring(1, tooth20Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth20Back.toString().substring(1, tooth20Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth20Middle
                        .toString()
                        .substring(1, tooth20Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth20Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth20Back.toString().substring(1, tooth20Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth20Front == null || tooth20Middle == null || tooth20Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth21Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 21 Front'] != null) {
        tooth21Front = ('${snapshot.data['tooth 21 Front']}');
      }
      if (snapshot.data['tooth 21 Middle'] != null) {
        tooth21Middle = ('${snapshot.data['tooth 21 Middle']}');
      }
      if (snapshot.data['tooth 21 Back'] != null) {
        tooth21Back = ('${snapshot.data['tooth 21 Back']}');
      }
    }
  });

  if (tooth21Front != null) {
    if (tooth21Middle != null) {
      if (tooth21Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth21Front
                          .toString()
                          .substring(1, tooth21Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth21Middle
                          .toString()
                          .substring(1, tooth21Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth21Back
                          .toString()
                          .substring(1, tooth21Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth21Front
                        .toString()
                        .substring(1, tooth21Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth21Middle
                        .toString()
                        .substring(1, tooth21Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth21Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth21Front
                        .toString()
                        .substring(1, tooth21Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth21Back.toString().substring(1, tooth21Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth21Front
                        .toString()
                        .substring(1, tooth21Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth21Middle != null) {
    if (tooth21Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth21Middle
                        .toString()
                        .substring(1, tooth21Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth21Back.toString().substring(1, tooth21Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth21Middle
                        .toString()
                        .substring(1, tooth21Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth21Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth21Back.toString().substring(1, tooth21Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth21Front == null || tooth21Middle == null || tooth21Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth22Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 22 Front'] != null) {
        tooth22Front = ('${snapshot.data['tooth 22 Front']}');
      }
      if (snapshot.data['tooth 22 Middle'] != null) {
        tooth22Middle = ('${snapshot.data['tooth 22 Middle']}');
      }
      if (snapshot.data['tooth 22 Back'] != null) {
        tooth22Back = ('${snapshot.data['tooth 22 Back']}');
      }
    }
  });

  if (tooth22Front != null) {
    if (tooth22Middle != null) {
      if (tooth22Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth22Front
                          .toString()
                          .substring(1, tooth22Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth22Middle
                          .toString()
                          .substring(1, tooth22Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth22Back
                          .toString()
                          .substring(1, tooth22Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth22Front
                        .toString()
                        .substring(1, tooth22Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth22Middle
                        .toString()
                        .substring(1, tooth22Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth22Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth22Front
                        .toString()
                        .substring(1, tooth22Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth22Back.toString().substring(1, tooth22Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth22Front
                        .toString()
                        .substring(1, tooth22Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth22Middle != null) {
    if (tooth22Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth22Middle
                        .toString()
                        .substring(1, tooth22Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth22Back.toString().substring(1, tooth22Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth22Middle
                        .toString()
                        .substring(1, tooth22Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth22Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth22Back.toString().substring(1, tooth22Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth22Front == null || tooth22Middle == null || tooth22Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth23Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 23 Front'] != null) {
        tooth23Front = ('${snapshot.data['tooth 23 Front']}');
      }
      if (snapshot.data['tooth 23 Middle'] != null) {
        tooth23Middle = ('${snapshot.data['tooth 23 Middle']}');
      }
      if (snapshot.data['tooth 23 Back'] != null) {
        tooth23Back = ('${snapshot.data['tooth 23 Back']}');
      }
    }
  });

  if (tooth23Front != null) {
    if (tooth23Middle != null) {
      if (tooth23Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth23Front
                          .toString()
                          .substring(1, tooth23Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth23Middle
                          .toString()
                          .substring(1, tooth23Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth23Back
                          .toString()
                          .substring(1, tooth23Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth23Front
                        .toString()
                        .substring(1, tooth23Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth23Middle
                        .toString()
                        .substring(1, tooth23Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth23Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth23Front
                        .toString()
                        .substring(1, tooth23Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth23Back.toString().substring(1, tooth23Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth23Front
                        .toString()
                        .substring(1, tooth23Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth23Middle != null) {
    if (tooth23Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth23Middle
                        .toString()
                        .substring(1, tooth23Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth23Back.toString().substring(1, tooth23Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth23Middle
                        .toString()
                        .substring(1, tooth23Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth23Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth23Back.toString().substring(1, tooth23Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth23Front == null || tooth23Middle == null || tooth23Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth24Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 24 Front'] != null) {
        tooth24Front = ('${snapshot.data['tooth 24 Front']}');
      }
      if (snapshot.data['tooth 24 Middle'] != null) {
        tooth24Middle = ('${snapshot.data['tooth 24 Middle']}');
      }
      if (snapshot.data['tooth 24 Back'] != null) {
        tooth24Back = ('${snapshot.data['tooth 24 Back']}');
      }
    }
  });

  if (tooth24Front != null) {
    if (tooth24Middle != null) {
      if (tooth24Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth24Front
                          .toString()
                          .substring(1, tooth24Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth24Middle
                          .toString()
                          .substring(1, tooth24Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth24Back
                          .toString()
                          .substring(1, tooth24Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth24Front
                        .toString()
                        .substring(1, tooth24Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth24Middle
                        .toString()
                        .substring(1, tooth24Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth24Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth24Front
                        .toString()
                        .substring(1, tooth24Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth24Back.toString().substring(1, tooth24Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth24Front
                        .toString()
                        .substring(1, tooth24Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth24Middle != null) {
    if (tooth24Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth24Middle
                        .toString()
                        .substring(1, tooth24Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth24Back.toString().substring(1, tooth24Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth24Middle
                        .toString()
                        .substring(1, tooth24Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth24Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth24Back.toString().substring(1, tooth24Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth24Front == null || tooth24Middle == null || tooth24Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth25Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 25 Front'] != null) {
        tooth25Front = ('${snapshot.data['tooth 25 Front']}');
      }
      if (snapshot.data['tooth 25 Middle'] != null) {
        tooth25Middle = ('${snapshot.data['tooth 25 Middle']}');
      }
      if (snapshot.data['tooth 25 Back'] != null) {
        tooth25Back = ('${snapshot.data['tooth 25 Back']}');
      }
    }
  });

  if (tooth25Front != null) {
    if (tooth25Middle != null) {
      if (tooth25Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth25Front
                          .toString()
                          .substring(1, tooth25Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth25Middle
                          .toString()
                          .substring(1, tooth25Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth25Back
                          .toString()
                          .substring(1, tooth25Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth25Front
                        .toString()
                        .substring(1, tooth25Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth25Middle
                        .toString()
                        .substring(1, tooth25Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth25Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth25Front
                        .toString()
                        .substring(1, tooth25Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth25Back.toString().substring(1, tooth25Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth25Front
                        .toString()
                        .substring(1, tooth25Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth25Middle != null) {
    if (tooth25Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth25Middle
                        .toString()
                        .substring(1, tooth25Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth25Back.toString().substring(1, tooth25Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth25Middle
                        .toString()
                        .substring(1, tooth25Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth25Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth25Back.toString().substring(1, tooth25Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth25Front == null || tooth25Middle == null || tooth25Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth26Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 26 Front'] != null) {
        tooth26Front = ('${snapshot.data['tooth 26 Front']}');
      }
      if (snapshot.data['tooth 26 Middle'] != null) {
        tooth26Middle = ('${snapshot.data['tooth 26 Middle']}');
      }
      if (snapshot.data['tooth 26 Back'] != null) {
        tooth26Back = ('${snapshot.data['tooth 26 Back']}');
      }
    }
  });

  if (tooth26Front != null) {
    if (tooth26Middle != null) {
      if (tooth26Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth26Front
                          .toString()
                          .substring(1, tooth26Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth26Middle
                          .toString()
                          .substring(1, tooth26Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth26Back
                          .toString()
                          .substring(1, tooth26Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth26Front
                        .toString()
                        .substring(1, tooth26Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth26Middle
                        .toString()
                        .substring(1, tooth26Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth26Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth26Front
                        .toString()
                        .substring(1, tooth26Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth26Back.toString().substring(1, tooth26Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth26Front
                        .toString()
                        .substring(1, tooth26Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth26Middle != null) {
    if (tooth26Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth26Middle
                        .toString()
                        .substring(1, tooth26Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth26Back.toString().substring(1, tooth26Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth26Middle
                        .toString()
                        .substring(1, tooth26Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth26Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth26Back.toString().substring(1, tooth26Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth26Front == null || tooth26Middle == null || tooth26Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth27Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 27 Front'] != null) {
        tooth27Front = ('${snapshot.data['tooth 27 Front']}');
      }
      if (snapshot.data['tooth 27 Middle'] != null) {
        tooth27Middle = ('${snapshot.data['tooth 27 Middle']}');
      }
      if (snapshot.data['tooth 27 Back'] != null) {
        tooth27Back = ('${snapshot.data['tooth 27 Back']}');
      }
    }
  });

  if (tooth27Front != null) {
    if (tooth27Middle != null) {
      if (tooth27Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth27Front
                          .toString()
                          .substring(1, tooth27Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth27Middle
                          .toString()
                          .substring(1, tooth27Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth27Back
                          .toString()
                          .substring(1, tooth27Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth27Front
                        .toString()
                        .substring(1, tooth27Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth27Middle
                        .toString()
                        .substring(1, tooth27Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth27Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth27Front
                        .toString()
                        .substring(1, tooth27Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth27Back.toString().substring(1, tooth27Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth27Front
                        .toString()
                        .substring(1, tooth27Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth27Middle != null) {
    if (tooth27Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth27Middle
                        .toString()
                        .substring(1, tooth27Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth27Back.toString().substring(1, tooth27Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth27Middle
                        .toString()
                        .substring(1, tooth27Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth27Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth27Back.toString().substring(1, tooth27Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth27Front == null || tooth27Middle == null || tooth27Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth28Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 28 Front'] != null) {
        tooth28Front = ('${snapshot.data['tooth 28 Front']}');
      }
      if (snapshot.data['tooth 28 Middle'] != null) {
        tooth28Middle = ('${snapshot.data['tooth 28 Middle']}');
      }
      if (snapshot.data['tooth 28 Back'] != null) {
        tooth28Back = ('${snapshot.data['tooth 28 Back']}');
      }
    }
  });

  if (tooth28Front != null) {
    if (tooth28Middle != null) {
      if (tooth28Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth28Front
                          .toString()
                          .substring(1, tooth28Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth28Middle
                          .toString()
                          .substring(1, tooth28Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth28Back
                          .toString()
                          .substring(1, tooth28Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth28Front
                        .toString()
                        .substring(1, tooth28Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth28Middle
                        .toString()
                        .substring(1, tooth28Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth28Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth28Front
                        .toString()
                        .substring(1, tooth28Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth28Back.toString().substring(1, tooth28Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth28Front
                        .toString()
                        .substring(1, tooth28Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth28Middle != null) {
    if (tooth28Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth28Middle
                        .toString()
                        .substring(1, tooth28Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth28Back.toString().substring(1, tooth28Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth28Middle
                        .toString()
                        .substring(1, tooth28Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth28Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth28Back.toString().substring(1, tooth28Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth28Front == null || tooth28Middle == null || tooth28Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth29Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 29 Front'] != null) {
        tooth29Front = ('${snapshot.data['tooth 29 Front']}');
      }
      if (snapshot.data['tooth 29 Middle'] != null) {
        tooth29Middle = ('${snapshot.data['tooth 29 Middle']}');
      }
      if (snapshot.data['tooth 29 Back'] != null) {
        tooth29Back = ('${snapshot.data['tooth 29 Back']}');
      }
    }
  });

  if (tooth29Front != null) {
    if (tooth29Middle != null) {
      if (tooth29Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth29Front
                          .toString()
                          .substring(1, tooth29Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth29Middle
                          .toString()
                          .substring(1, tooth29Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth29Back
                          .toString()
                          .substring(1, tooth29Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth29Front
                        .toString()
                        .substring(1, tooth29Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth29Middle
                        .toString()
                        .substring(1, tooth29Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth29Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth29Front
                        .toString()
                        .substring(1, tooth29Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth29Back.toString().substring(1, tooth29Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth29Front
                        .toString()
                        .substring(1, tooth29Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth29Middle != null) {
    if (tooth29Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth29Middle
                        .toString()
                        .substring(1, tooth29Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth29Back.toString().substring(1, tooth29Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth29Middle
                        .toString()
                        .substring(1, tooth29Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth29Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth29Back.toString().substring(1, tooth29Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth29Front == null || tooth29Middle == null || tooth29Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth30Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 30 Front'] != null) {
        tooth30Front = ('${snapshot.data['tooth 30 Front']}');
      }
      if (snapshot.data['tooth 30 Middle'] != null) {
        tooth30Middle = ('${snapshot.data['tooth 30 Middle']}');
      }
      if (snapshot.data['tooth 30 Back'] != null) {
        tooth30Back = ('${snapshot.data['tooth 30 Back']}');
      }
    }
  });

  if (tooth30Front != null) {
    if (tooth30Middle != null) {
      if (tooth30Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth30Front
                          .toString()
                          .substring(1, tooth30Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth30Middle
                          .toString()
                          .substring(1, tooth30Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth30Back
                          .toString()
                          .substring(1, tooth30Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth30Front
                        .toString()
                        .substring(1, tooth30Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth30Middle
                        .toString()
                        .substring(1, tooth30Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth30Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth30Front
                        .toString()
                        .substring(1, tooth30Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth30Back.toString().substring(1, tooth30Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth30Front
                        .toString()
                        .substring(1, tooth30Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth30Middle != null) {
    if (tooth30Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth30Middle
                        .toString()
                        .substring(1, tooth30Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth30Back.toString().substring(1, tooth30Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth30Middle
                        .toString()
                        .substring(1, tooth1Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth30Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth30Back.toString().substring(1, tooth30Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth30Front == null || tooth30Middle == null || tooth30Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth31Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
      if (snapshot.data['tooth 31 Front'] != null) {
        tooth31Front = ('${snapshot.data['tooth 31 Front']}');
      }
      if (snapshot.data['tooth 31 Middle'] != null) {
        tooth31Middle = ('${snapshot.data['tooth 31 Middle']}');
      }
      if (snapshot.data['tooth 31 Back'] != null) {
        tooth31Back = ('${snapshot.data['tooth 31 Back']}');
      }
    }
  });

  if (tooth31Front != null) {
    if (tooth31Middle != null) {
      if (tooth31Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth31Front
                          .toString()
                          .substring(1, tooth31Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth31Middle
                          .toString()
                          .substring(1, tooth31Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth31Back
                          .toString()
                          .substring(1, tooth31Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth31Front
                        .toString()
                        .substring(1, tooth31Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth31Middle
                        .toString()
                        .substring(1, tooth31Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth31Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth31Front
                        .toString()
                        .substring(1, tooth31Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth31Back.toString().substring(1, tooth31Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth31Front
                        .toString()
                        .substring(1, tooth31Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth31Middle != null) {
    if (tooth31Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth31Middle
                        .toString()
                        .substring(1, tooth31Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth31Back.toString().substring(1, tooth31Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth31Middle
                        .toString()
                        .substring(1, tooth31Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth31Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth31Back.toString().substring(1, tooth31Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth31Front == null || tooth31Middle == null || tooth31Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth32Card() {
  Firestore firestore = Firestore.instance;
  CollectionReference collectionReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('DentalCase');
  collectionReference.snapshots().listen((response) {
    List<DocumentSnapshot> snapshots = response.documents;
    for (var snapshot in snapshots) {
      // List<String> read1 = List.from(snapshot['tooth 1 Front']);
      // print(read1);
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

  if (tooth32Front != null) {
    if (tooth32Middle != null) {
      if (tooth32Back != null) {
        return Container(
          height: 300,
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
                  'Front : ' +
                      tooth32Front
                          .toString()
                          .substring(1, tooth32Front.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' +
                      tooth32Middle
                          .toString()
                          .substring(1, tooth32Middle.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' +
                      tooth32Back
                          .toString()
                          .substring(1, tooth32Back.length - 1),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "Date: 22/09/20",
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 14,
                //   ),
                // ),
              ],
            ),
          ),
        );
      }
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth32Front
                        .toString()
                        .substring(1, tooth32Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Middle : ' +
                    tooth32Middle
                        .toString()
                        .substring(1, tooth32Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else if (tooth32Back != null) {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth32Front
                        .toString()
                        .substring(1, tooth32Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth32Back.toString().substring(1, tooth32Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Front : ' +
                    tooth32Front
                        .toString()
                        .substring(1, tooth32Front.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth32Middle != null) {
    if (tooth32Back != null) {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth32Middle
                        .toString()
                        .substring(1, tooth32Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              Text('                            '),
              Text(
                'Back : ' +
                    tooth32Back.toString().substring(1, tooth32Back.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        height: 300,
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
                'Middle : ' +
                    tooth32Middle
                        .toString()
                        .substring(1, tooth32Middle.length - 1),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              // Text(
              //   "Date: 22/09/20",
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 14,
              //   ),
              // ),
            ],
          ),
        ),
      );
    }
  } else if (tooth32Back != null) {
    return Container(
      height: 300,
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
              'Back : ' +
                  tooth32Back.toString().substring(1, tooth32Back.length - 1),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
  if (tooth32Front == null || tooth32Middle == null || tooth32Back == null) {
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
            // Text(
            //   "Date: 22/09/20",
            //   style: TextStyle(
            //     color: Colors.white,
            //     fontSize: 14,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

String uid;
void toothid(String getidtohis) {
  uid = getidtohis;
}
