import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/DentRecord/card_detail_screen.dart';
import 'package:fundee/Screen/constants.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentalRecord.dart';

class DentailHistoryTooth1Card extends StatefulWidget {
  @override
  _DentailHistoryTooth1CardState createState() =>
      _DentailHistoryTooth1CardState();
}

class _DentailHistoryTooth1CardState extends State<DentailHistoryTooth1Card> {
  @override
  void initState() {
    super.initState();
    dentailHistoryTooth1Card(context);
    dentailHistoryTooth2Card(context);
    dentailHistoryTooth3Card(context);
    dentailHistoryTooth4Card(context);
    dentailHistoryTooth5Card(context);
    dentailHistoryTooth6Card(context);
    dentailHistoryTooth7Card(context);
    dentailHistoryTooth8Card(context);
    dentailHistoryTooth9Card(context);
    dentailHistoryTooth10Card(context);
    dentailHistoryTooth11Card(context);
    dentailHistoryTooth12Card(context);
    dentailHistoryTooth13Card(context);
    dentailHistoryTooth14Card(context);
    dentailHistoryTooth15Card(context);
    dentailHistoryTooth16Card(context);
    dentailHistoryTooth17Card(context);
    dentailHistoryTooth18Card(context);
    dentailHistoryTooth19Card(context);
    dentailHistoryTooth20Card(context);
    dentailHistoryTooth21Card(context);
    dentailHistoryTooth22Card(context);
    dentailHistoryTooth23Card(context);
    dentailHistoryTooth24Card(context);
    dentailHistoryTooth25Card(context);
    dentailHistoryTooth26Card(context);
    dentailHistoryTooth27Card(context);
    dentailHistoryTooth28Card(context);
    dentailHistoryTooth29Card(context);
    dentailHistoryTooth30Card(context);
    dentailHistoryTooth31Card(context);
    dentailHistoryTooth32Card(context);
    getClinic();
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

dentailHistoryTooth1Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 1 Front'] != null) {
      for (var i = 0; i < value.data['tooth 1 Front'].length; i++) {
        if (tooth1Front.contains(value.data['tooth 1 Front'][i]['Case']) ==
            false) {
          tooth1Front.add(value.data['tooth 1 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 1 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 1 Middle'].length; i++) {
        if (tooth1Middle.contains(value.data['tooth 1 Middle'][i]['Case']) ==
            false) {
          tooth1Middle.add(value.data['tooth 1 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 1 Back'] != null) {
      for (var i = 0; i < value.data['tooth 1 Back'].length; i++) {
        if (tooth1Back.contains(value.data['tooth 1 Back'][i]['Case']) ==
            false) {
          tooth1Back.add(value.data['tooth 1 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth1Front.isNotEmpty) {
    if (tooth1Middle.isNotEmpty) {
      if (tooth1Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : $tooth1Front',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : $tooth1Middle',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : $tooth1Back',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth1CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth1Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth1Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth1CardDetail()));
        },
      );
    } else if (tooth1Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth1Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth1Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth1CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth1Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth1CardDetail()));
        },
      );
    }
  } else if (tooth1Middle.isNotEmpty) {
    if (tooth1Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth1Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth1Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth1CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth1Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth1CardDetail()));
        },
      );
    }
  } else if (tooth1Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth1Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth1CardDetail()));
      },
    );
  }
  if (tooth1Front.isEmpty || tooth1Middle.isEmpty || tooth1Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth2Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 2 Front'] != null) {
      for (var i = 0; i < value.data['tooth 2 Front'].length; i++) {
        if (tooth2Front.contains(value.data['tooth 2 Front'][i]['Case']) ==
            false) {
          tooth2Front.add(value.data['tooth 2 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 2 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 2 Middle'].length; i++) {
        if (tooth2Middle.contains(value.data['tooth 2 Middle'][i]['Case']) ==
            false) {
          tooth2Middle.add(value.data['tooth 2 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 2 Back'] != null) {
      for (var i = 0; i < value.data['tooth 2 Back'].length; i++) {
        if (tooth2Back.contains(value.data['tooth 2 Back'][i]['Case']) ==
            false) {
          tooth2Back.add(value.data['tooth 2 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth2Front.isNotEmpty) {
    if (tooth2Middle.isNotEmpty) {
      if (tooth2Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth2Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth2Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth2Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth2CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth2Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth2Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth2CardDetail()));
        },
      );
    } else if (tooth2Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth2Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth2Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth2CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth2Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth2CardDetail()));
        },
      );
    }
  } else if (tooth2Middle.isNotEmpty) {
    if (tooth2Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth2Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth2Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth2CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth2Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth2CardDetail()));
        },
      );
    }
  } else if (tooth2Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth2Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth2CardDetail()));
      },
    );
  }
  if (tooth2Front.isEmpty || tooth2Middle.isEmpty || tooth2Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth3Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 3 Front'] != null) {
      for (var i = 0; i < value.data['tooth 3 Front'].length; i++) {
        if (tooth3Front.contains(value.data['tooth 3 Front'][i]['Case']) ==
            false) {
          tooth3Front.add(value.data['tooth 3 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 3 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 3 Middle'].length; i++) {
        if (tooth3Middle.contains(value.data['tooth 3 Middle'][i]['Case']) ==
            false) {
          tooth3Middle.add(value.data['tooth 3 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 3 Back'] != null) {
      for (var i = 0; i < value.data['tooth 3 Back'].length; i++) {
        if (tooth3Back.contains(value.data['tooth 3 Back'][i]['Case']) ==
            false) {
          tooth3Back.add(value.data['tooth 3 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth3Front.isNotEmpty) {
    if (tooth3Middle.isNotEmpty) {
      if (tooth3Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth3Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth3Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth3Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth3CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth3Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth3Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth3CardDetail()));
        },
      );
    } else if (tooth3Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth3Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth3Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth3CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth3Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth3CardDetail()));
        },
      );
    }
  } else if (tooth3Middle.isNotEmpty) {
    if (tooth3Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth3Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth3Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth3CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth3Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth3CardDetail()));
        },
      );
    }
  } else if (tooth3Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth3Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth3CardDetail()));
      },
    );
  }
  if (tooth3Front.isEmpty || tooth3Middle.isEmpty || tooth3Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth4Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 4 Front'] != null) {
      for (var i = 0; i < value.data['tooth 4 Front'].length; i++) {
        if (tooth4Front.contains(value.data['tooth 4 Front'][i]['Case']) ==
            false) {
          tooth4Front.add(value.data['tooth 4 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 4 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 4 Middle'].length; i++) {
        if (tooth4Middle.contains(value.data['tooth 4 Middle'][i]['Case']) ==
            false) {
          tooth4Middle.add(value.data['tooth 4 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 4 Back'] != null) {
      for (var i = 0; i < value.data['tooth 4 Back'].length; i++) {
        if (tooth4Back.contains(value.data['tooth 4 Back'][i]['Case']) ==
            false) {
          tooth4Back.add(value.data['tooth 4 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth4Front.isNotEmpty) {
    if (tooth4Middle.isNotEmpty) {
      if (tooth4Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth4Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth4Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth4Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth4CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth4Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth4Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth4CardDetail()));
        },
      );
    } else if (tooth4Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth4Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth4Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth4CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth4Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth4CardDetail()));
        },
      );
    }
  } else if (tooth4Middle.isNotEmpty) {
    if (tooth4Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth4Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth4Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth4CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth4Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth4CardDetail()));
        },
      );
    }
  } else if (tooth4Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth4Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth4CardDetail()));
      },
    );
  }
  if (tooth4Front.isEmpty || tooth4Middle.isEmpty || tooth4Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth5Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 5 Front'] != null) {
      for (var i = 0; i < value.data['tooth 5 Front'].length; i++) {
        if (tooth5Front.contains(value.data['tooth 5 Front'][i]['Case']) ==
            false) {
          tooth5Front.add(value.data['tooth 5 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 5 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 5 Middle'].length; i++) {
        if (tooth5Middle.contains(value.data['tooth 5 Middle'][i]['Case']) ==
            false) {
          tooth5Middle.add(value.data['tooth 5 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 5 Back'] != null) {
      for (var i = 0; i < value.data['tooth 5 Back'].length; i++) {
        if (tooth5Back.contains(value.data['tooth 5 Back'][i]['Case']) ==
            false) {
          tooth5Back.add(value.data['tooth 5 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth5Front.isNotEmpty) {
    if (tooth5Middle.isNotEmpty) {
      if (tooth5Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth5Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth5Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth5Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth5CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth5Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth5Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth5CardDetail()));
        },
      );
    } else if (tooth5Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth5Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth5Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth5CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth5Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth5CardDetail()));
        },
      );
    }
  } else if (tooth5Middle.isNotEmpty) {
    if (tooth5Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth5Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth5Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth5CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth5Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth5CardDetail()));
        },
      );
    }
  } else if (tooth5Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth5Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth5CardDetail()));
      },
    );
  }
  if (tooth5Front.isEmpty || tooth5Middle.isEmpty || tooth5Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth6Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 6 Front'] != null) {
      for (var i = 0; i < value.data['tooth 6 Front'].length; i++) {
        if (tooth6Front.contains(value.data['tooth 6 Front'][i]['Case']) ==
            false) {
          tooth6Front.add(value.data['tooth 6 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 6 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 6 Middle'].length; i++) {
        if (tooth6Middle.contains(value.data['tooth 6 Middle'][i]['Case']) ==
            false) {
          tooth6Middle.add(value.data['tooth 6 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 6 Back'] != null) {
      for (var i = 0; i < value.data['tooth 6 Back'].length; i++) {
        if (tooth6Back.contains(value.data['tooth 6 Back'][i]['Case']) ==
            false) {
          tooth6Back.add(value.data['tooth 6 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth6Front.isNotEmpty) {
    if (tooth6Middle.isNotEmpty) {
      if (tooth6Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth6Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth6Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth6Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth6CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth6Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth6Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth6CardDetail()));
        },
      );
    } else if (tooth6Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth6Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth6Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth6CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth6Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth6CardDetail()));
        },
      );
    }
  } else if (tooth6Middle.isNotEmpty) {
    if (tooth6Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth6Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth6Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth6CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth6Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth6CardDetail()));
        },
      );
    }
  } else if (tooth6Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth6Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth6CardDetail()));
      },
    );
  }
  if (tooth6Front.isEmpty || tooth6Middle.isEmpty || tooth6Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth7Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 7 Front'] != null) {
      for (var i = 0; i < value.data['tooth 7 Front'].length; i++) {
        if (tooth7Front.contains(value.data['tooth 7 Front'][i]['Case']) ==
            false) {
          tooth7Front.add(value.data['tooth 7 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 7 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 7 Middle'].length; i++) {
        if (tooth7Middle.contains(value.data['tooth 7 Middle'][i]['Case']) ==
            false) {
          tooth7Middle.add(value.data['tooth 7 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 7 Back'] != null) {
      for (var i = 0; i < value.data['tooth 7 Back'].length; i++) {
        if (tooth7Back.contains(value.data['tooth 7 Back'][i]['Case']) ==
            false) {
          tooth7Back.add(value.data['tooth 7 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth7Front.isNotEmpty) {
    if (tooth7Middle.isNotEmpty) {
      if (tooth7Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth7Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth7Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth7Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth7CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth7Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth7Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth7CardDetail()));
        },
      );
    } else if (tooth7Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth7Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth7Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth7CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth7Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth7CardDetail()));
        },
      );
    }
  } else if (tooth7Middle.isNotEmpty) {
    if (tooth7Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth7Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth7Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth7CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth7Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth7CardDetail()));
        },
      );
    }
  } else if (tooth7Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth7Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth7CardDetail()));
      },
    );
  }
  if (tooth7Front.isEmpty || tooth7Middle.isEmpty || tooth7Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth8Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 8 Front'] != null) {
      for (var i = 0; i < value.data['tooth 8 Front'].length; i++) {
        if (tooth8Front.contains(value.data['tooth 8 Front'][i]['Case']) ==
            false) {
          tooth8Front.add(value.data['tooth 8 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 8 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 8 Middle'].length; i++) {
        if (tooth8Middle.contains(value.data['tooth 8 Middle'][i]['Case']) ==
            false) {
          tooth8Middle.add(value.data['tooth 8 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 8 Back'] != null) {
      for (var i = 0; i < value.data['tooth 8 Back'].length; i++) {
        if (tooth8Back.contains(value.data['tooth 8 Back'][i]['Case']) ==
            false) {
          tooth8Back.add(value.data['tooth 8 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth8Front.isNotEmpty) {
    if (tooth8Middle.isNotEmpty) {
      if (tooth8Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth8Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth8Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth8Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth8CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth8Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth8Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth8CardDetail()));
        },
      );
    } else if (tooth8Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth8Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth8Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth8CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth8Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth8CardDetail()));
        },
      );
    }
  } else if (tooth8Middle.isNotEmpty) {
    if (tooth8Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth8Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth8Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth8CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth8Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth8CardDetail()));
        },
      );
    }
  } else if (tooth8Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth8Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth8CardDetail()));
      },
    );
  }
  if (tooth8Front.isEmpty || tooth8Middle.isEmpty || tooth8Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth9Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 9 Front'] != null) {
      for (var i = 0; i < value.data['tooth 9 Front'].length; i++) {
        if (tooth9Front.contains(value.data['tooth 9 Front'][i]['Case']) ==
            false) {
          tooth9Front.add(value.data['tooth 9 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 9 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 9 Middle'].length; i++) {
        if (tooth9Middle.contains(value.data['tooth 9 Middle'][i]['Case']) ==
            false) {
          tooth9Middle.add(value.data['tooth 9 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 9 Back'] != null) {
      for (var i = 0; i < value.data['tooth 9 Back'].length; i++) {
        if (tooth9Back.contains(value.data['tooth 9 Back'][i]['Case']) ==
            false) {
          tooth9Back.add(value.data['tooth 9 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth9Front.isNotEmpty) {
    if (tooth9Middle.isNotEmpty) {
      if (tooth9Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth9Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth9Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth9Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth9CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth9Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth9Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth9CardDetail()));
        },
      );
    } else if (tooth9Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth9Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth9Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth9CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth9Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth9CardDetail()));
        },
      );
    }
  } else if (tooth9Middle.isNotEmpty) {
    if (tooth9Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth9Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth9Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth9CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth9Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth9CardDetail()));
        },
      );
    }
  } else if (tooth9Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth9Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth9CardDetail()));
      },
    );
  }
  if (tooth9Front.isEmpty || tooth9Middle.isEmpty || tooth9Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth10Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 10 Front'] != null) {
      for (var i = 0; i < value.data['tooth 10 Front'].length; i++) {
        if (tooth10Front.contains(value.data['tooth 10 Front'][i]['Case']) ==
            false) {
          tooth10Front.add(value.data['tooth 10 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 10 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 10 Middle'].length; i++) {
        if (tooth10Middle.contains(value.data['tooth 10 Middle'][i]['Case']) ==
            false) {
          tooth10Middle.add(value.data['tooth 10 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 10 Back'] != null) {
      for (var i = 0; i < value.data['tooth 10 Back'].length; i++) {
        if (tooth10Back.contains(value.data['tooth 10 Back'][i]['Case']) ==
            false) {
          tooth10Back.add(value.data['tooth 10 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth10Front.isNotEmpty) {
    if (tooth10Middle.isNotEmpty) {
      if (tooth10Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth10Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth10Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth10Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth10CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth10Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth10Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth10CardDetail()));
        },
      );
    } else if (tooth10Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth10Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth10Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth10CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth10Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth10CardDetail()));
        },
      );
    }
  } else if (tooth10Middle.isNotEmpty) {
    if (tooth10Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth10Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth10Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth10CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth10Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth10CardDetail()));
        },
      );
    }
  } else if (tooth10Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth10Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth10CardDetail()));
      },
    );
  }
  if (tooth10Front.isEmpty || tooth10Middle.isEmpty || tooth10Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth11Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 11 Front'] != null) {
      for (var i = 0; i < value.data['tooth 11 Front'].length; i++) {
        if (tooth11Front.contains(value.data['tooth 11 Front'][i]['Case']) ==
            false) {
          tooth11Front.add(value.data['tooth 11 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 11 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 11 Middle'].length; i++) {
        if (tooth11Middle.contains(value.data['tooth 11 Middle'][i]['Case']) ==
            false) {
          tooth11Middle.add(value.data['tooth 11 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 11 Back'] != null) {
      for (var i = 0; i < value.data['tooth 11 Back'].length; i++) {
        if (tooth11Back.contains(value.data['tooth 11 Back'][i]['Case']) ==
            false) {
          tooth11Back.add(value.data['tooth 11 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth11Front.isNotEmpty) {
    if (tooth11Middle.isNotEmpty) {
      if (tooth11Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth11Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth11Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth11Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth11CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth11Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth11Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth11CardDetail()));
        },
      );
    } else if (tooth11Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth11Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth11Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth11CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth11Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth11CardDetail()));
        },
      );
    }
  } else if (tooth11Middle.isNotEmpty) {
    if (tooth11Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth11Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth11Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth11CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth11Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth11CardDetail()));
        },
      );
    }
  } else if (tooth11Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth11Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth11CardDetail()));
      },
    );
  }
  if (tooth11Front.isEmpty || tooth11Middle.isEmpty || tooth11Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth12Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 12 Front'] != null) {
      for (var i = 0; i < value.data['tooth 12 Front'].length; i++) {
        if (tooth12Front.contains(value.data['tooth 12 Front'][i]['Case']) ==
            false) {
          tooth12Front.add(value.data['tooth 12 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 12 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 12 Middle'].length; i++) {
        if (tooth12Middle.contains(value.data['tooth 12 Middle'][i]['Case']) ==
            false) {
          tooth12Middle.add(value.data['tooth 12 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 12 Back'] != null) {
      for (var i = 0; i < value.data['tooth 12 Back'].length; i++) {
        if (tooth12Back.contains(value.data['tooth 12 Back'][i]['Case']) ==
            false) {
          tooth12Back.add(value.data['tooth 12 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth12Front.isNotEmpty) {
    if (tooth12Middle.isNotEmpty) {
      if (tooth12Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth12Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth12Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth12Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth12CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth12Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth12Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth12CardDetail()));
        },
      );
    } else if (tooth12Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth12Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth12Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth12CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth12Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth12CardDetail()));
        },
      );
    }
  } else if (tooth12Middle.isNotEmpty) {
    if (tooth12Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth12Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth12Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth12CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth12Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth12CardDetail()));
        },
      );
    }
  } else if (tooth12Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth12Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth12CardDetail()));
      },
    );
  }
  if (tooth12Front.isEmpty || tooth12Middle.isEmpty || tooth12Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth13Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 13 Front'] != null) {
      for (var i = 0; i < value.data['tooth 13 Front'].length; i++) {
        if (tooth13Front.contains(value.data['tooth 13 Front'][i]['Case']) ==
            false) {
          tooth13Front.add(value.data['tooth 13 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 13 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 13 Middle'].length; i++) {
        if (tooth13Middle.contains(value.data['tooth 13 Middle'][i]['Case']) ==
            false) {
          tooth13Middle.add(value.data['tooth 13 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 13 Back'] != null) {
      for (var i = 0; i < value.data['tooth 13 Back'].length; i++) {
        if (tooth13Back.contains(value.data['tooth 13 Back'][i]['Case']) ==
            false) {
          tooth13Back.add(value.data['tooth 13 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth13Front.isNotEmpty) {
    if (tooth13Middle.isNotEmpty) {
      if (tooth13Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth13Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth13Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth13Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth13CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth13Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth13Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth13CardDetail()));
        },
      );
    } else if (tooth13Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth13Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth13Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth13CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth13Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth13CardDetail()));
        },
      );
    }
  } else if (tooth13Middle.isNotEmpty) {
    if (tooth13Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth13Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth13Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth13CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth13Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth13CardDetail()));
        },
      );
    }
  } else if (tooth13Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth13Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth13CardDetail()));
      },
    );
  }
  if (tooth13Front.isEmpty || tooth13Middle.isEmpty || tooth13Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth14Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 14 Front'] != null) {
      for (var i = 0; i < value.data['tooth 14 Front'].length; i++) {
        if (tooth14Front.contains(value.data['tooth 14 Front'][i]['Case']) ==
            false) {
          tooth14Front.add(value.data['tooth 14 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 14 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 14 Middle'].length; i++) {
        if (tooth14Middle.contains(value.data['tooth 14 Middle'][i]['Case']) ==
            false) {
          tooth14Middle.add(value.data['tooth 14 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 14 Back'] != null) {
      for (var i = 0; i < value.data['tooth 14 Back'].length; i++) {
        if (tooth14Back.contains(value.data['tooth 14 Back'][i]['Case']) ==
            false) {
          tooth14Back.add(value.data['tooth 14 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth14Front.isNotEmpty) {
    if (tooth14Middle.isNotEmpty) {
      if (tooth14Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth14Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth14Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth14Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth14CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth14Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth14Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth14CardDetail()));
        },
      );
    } else if (tooth14Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth14Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth14Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth14CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth14Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth14CardDetail()));
        },
      );
    }
  } else if (tooth14Middle.isNotEmpty) {
    if (tooth14Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth14Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth14Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth14CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth14Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth14CardDetail()));
        },
      );
    }
  } else if (tooth14Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth14Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth14CardDetail()));
      },
    );
  }
  if (tooth14Front.isEmpty || tooth14Middle.isEmpty || tooth14Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth15Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 15 Front'] != null) {
      for (var i = 0; i < value.data['tooth 15 Front'].length; i++) {
        if (tooth15Front.contains(value.data['tooth 15 Front'][i]['Case']) ==
            false) {
          tooth15Front.add(value.data['tooth 15 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 15 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 15 Middle'].length; i++) {
        if (tooth15Middle.contains(value.data['tooth 15 Middle'][i]['Case']) ==
            false) {
          tooth15Middle.add(value.data['tooth 15 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 15 Back'] != null) {
      for (var i = 0; i < value.data['tooth 15 Back'].length; i++) {
        if (tooth15Back.contains(value.data['tooth 15 Back'][i]['Case']) ==
            false) {
          tooth15Back.add(value.data['tooth 15 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth15Front.isNotEmpty) {
    if (tooth15Middle.isNotEmpty) {
      if (tooth15Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth15Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth15Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth15Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth15CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth15Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth15Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth15CardDetail()));
        },
      );
    } else if (tooth15Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth15Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth15Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth15CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth15Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth15CardDetail()));
        },
      );
    }
  } else if (tooth15Middle.isNotEmpty) {
    if (tooth15Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth15Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth15Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth15CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth15Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth15CardDetail()));
        },
      );
    }
  } else if (tooth15Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth15Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth15CardDetail()));
      },
    );
  }
  if (tooth15Front.isEmpty || tooth15Middle.isEmpty || tooth15Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth16Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 16 Front'] != null) {
      for (var i = 0; i < value.data['tooth 16 Front'].length; i++) {
        if (tooth16Front.contains(value.data['tooth 16 Front'][i]['Case']) ==
            false) {
          tooth16Front.add(value.data['tooth 16 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 16 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 16 Middle'].length; i++) {
        if (tooth16Middle.contains(value.data['tooth 16 Middle'][i]['Case']) ==
            false) {
          tooth16Middle.add(value.data['tooth 16 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 16 Back'] != null) {
      for (var i = 0; i < value.data['tooth 16 Back'].length; i++) {
        if (tooth16Back.contains(value.data['tooth 16 Back'][i]['Case']) ==
            false) {
          tooth16Back.add(value.data['tooth 16 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth16Front.isNotEmpty) {
    if (tooth16Middle.isNotEmpty) {
      if (tooth16Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth16Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth16Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth16Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth16CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth16Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth16Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth16CardDetail()));
        },
      );
    } else if (tooth16Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth16Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth16Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth16CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth16Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth16CardDetail()));
        },
      );
    }
  } else if (tooth16Middle.isNotEmpty) {
    if (tooth16Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth16Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth16Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth16CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth16Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth16CardDetail()));
        },
      );
    }
  } else if (tooth16Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth16Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth16CardDetail()));
      },
    );
  }
  if (tooth16Front.isEmpty || tooth16Middle.isEmpty || tooth16Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth17Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 17 Front'] != null) {
      for (var i = 0; i < value.data['tooth 17 Front'].length; i++) {
        if (tooth17Front.contains(value.data['tooth 17 Front'][i]['Case']) ==
            false) {
          tooth17Front.add(value.data['tooth 17 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 17 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 17 Middle'].length; i++) {
        if (tooth17Middle.contains(value.data['tooth 17 Middle'][i]['Case']) ==
            false) {
          tooth17Middle.add(value.data['tooth 17 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 17 Back'] != null) {
      for (var i = 0; i < value.data['tooth 17 Back'].length; i++) {
        if (tooth17Back.contains(value.data['tooth 17 Back'][i]['Case']) ==
            false) {
          tooth17Back.add(value.data['tooth 17 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth17Front.isNotEmpty) {
    if (tooth17Middle.isNotEmpty) {
      if (tooth17Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth17Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth17Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth17Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth17CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth17Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth17Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth17CardDetail()));
        },
      );
    } else if (tooth17Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth17Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth17Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth17CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth17Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth17CardDetail()));
        },
      );
    }
  } else if (tooth17Middle.isNotEmpty) {
    if (tooth17Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth17Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth17Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth17CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth17Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth17CardDetail()));
        },
      );
    }
  } else if (tooth17Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth17Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth17CardDetail()));
      },
    );
  }
  if (tooth17Front.isEmpty || tooth17Middle.isEmpty || tooth17Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth18Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 18 Front'] != null) {
      for (var i = 0; i < value.data['tooth 18 Front'].length; i++) {
        if (tooth18Front.contains(value.data['tooth 18 Front'][i]['Case']) ==
            false) {
          tooth18Front.add(value.data['tooth 18 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 18 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 18 Middle'].length; i++) {
        if (tooth18Middle.contains(value.data['tooth 18 Middle'][i]['Case']) ==
            false) {
          tooth18Middle.add(value.data['tooth 18 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 18 Back'] != null) {
      for (var i = 0; i < value.data['tooth 18 Back'].length; i++) {
        if (tooth18Back.contains(value.data['tooth 18 Back'][i]['Case']) ==
            false) {
          tooth18Back.add(value.data['tooth 18 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth18Front.isNotEmpty) {
    if (tooth18Middle.isNotEmpty) {
      if (tooth18Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth18Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth18Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth18Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth18CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth18Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth18Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth18CardDetail()));
        },
      );
    } else if (tooth18Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth18Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth18Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth18CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth18Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth18CardDetail()));
        },
      );
    }
  } else if (tooth18Middle.isNotEmpty) {
    if (tooth18Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth18Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth18Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth18CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth18Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth18CardDetail()));
        },
      );
    }
  } else if (tooth18Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth18Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth18CardDetail()));
      },
    );
  }
  if (tooth18Front.isEmpty || tooth18Middle.isEmpty || tooth18Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth19Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 19 Front'] != null) {
      for (var i = 0; i < value.data['tooth 19 Front'].length; i++) {
        if (tooth19Front.contains(value.data['tooth 19 Front'][i]['Case']) ==
            false) {
          tooth19Front.add(value.data['tooth 19 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 19 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 19 Middle'].length; i++) {
        if (tooth19Middle.contains(value.data['tooth 19 Middle'][i]['Case']) ==
            false) {
          tooth19Middle.add(value.data['tooth 19 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 19 Back'] != null) {
      for (var i = 0; i < value.data['tooth 19 Back'].length; i++) {
        if (tooth19Back.contains(value.data['tooth 19 Back'][i]['Case']) ==
            false) {
          tooth19Back.add(value.data['tooth 19 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth19Front.isNotEmpty) {
    if (tooth19Middle.isNotEmpty) {
      if (tooth19Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth19Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth19Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth19Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth19CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth19Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth19Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth19CardDetail()));
        },
      );
    } else if (tooth19Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth19Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth19Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth19CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth19Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth19CardDetail()));
        },
      );
    }
  } else if (tooth19Middle.isNotEmpty) {
    if (tooth19Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth19Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth19Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth19CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth19Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth19CardDetail()));
        },
      );
    }
  } else if (tooth19Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth19Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth19CardDetail()));
      },
    );
  }
  if (tooth19Front.isEmpty || tooth19Middle.isEmpty || tooth19Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth20Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 20 Front'] != null) {
      for (var i = 0; i < value.data['tooth 20 Front'].length; i++) {
        if (tooth20Front.contains(value.data['tooth 20 Front'][i]['Case']) ==
            false) {
          tooth20Front.add(value.data['tooth 20 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 20 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 20 Middle'].length; i++) {
        if (tooth20Middle.contains(value.data['tooth 20 Middle'][i]['Case']) ==
            false) {
          tooth20Middle.add(value.data['tooth 20 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 20 Back'] != null) {
      for (var i = 0; i < value.data['tooth 20 Back'].length; i++) {
        if (tooth20Back.contains(value.data['tooth 20 Back'][i]['Case']) ==
            false) {
          tooth20Back.add(value.data['tooth 20 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth20Front.isNotEmpty) {
    if (tooth20Middle.isNotEmpty) {
      if (tooth20Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth20Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth20Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth20Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth20CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth20Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth20Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth20CardDetail()));
        },
      );
    } else if (tooth20Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth20Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth20Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth20CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth20Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth20CardDetail()));
        },
      );
    }
  } else if (tooth20Middle.isNotEmpty) {
    if (tooth20Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth20Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth20Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth20CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth20Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth20CardDetail()));
        },
      );
    }
  } else if (tooth20Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth20Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth20CardDetail()));
      },
    );
  }
  if (tooth20Front.isEmpty || tooth20Middle.isEmpty || tooth20Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth21Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 21 Front'] != null) {
      for (var i = 0; i < value.data['tooth 21 Front'].length; i++) {
        if (tooth21Front.contains(value.data['tooth 21 Front'][i]['Case']) ==
            false) {
          tooth21Front.add(value.data['tooth 21 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 21 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 21 Middle'].length; i++) {
        if (tooth21Middle.contains(value.data['tooth 21 Middle'][i]['Case']) ==
            false) {
          tooth21Middle.add(value.data['tooth 21 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 21 Back'] != null) {
      for (var i = 0; i < value.data['tooth 21 Back'].length; i++) {
        if (tooth21Back.contains(value.data['tooth 21 Back'][i]['Case']) ==
            false) {
          tooth21Back.add(value.data['tooth 21 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth21Front.isNotEmpty) {
    if (tooth21Middle.isNotEmpty) {
      if (tooth21Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth21Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth21Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth21Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth21CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth21Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth21Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth21CardDetail()));
        },
      );
    } else if (tooth21Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth21Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth21Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth21CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth21Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth21CardDetail()));
        },
      );
    }
  } else if (tooth21Middle.isNotEmpty) {
    if (tooth21Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth21Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth21Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth21CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth21Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth21CardDetail()));
        },
      );
    }
  } else if (tooth21Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth21Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth21CardDetail()));
      },
    );
  }
  if (tooth21Front.isEmpty || tooth21Middle.isEmpty || tooth21Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth22Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 22 Front'] != null) {
      for (var i = 0; i < value.data['tooth 22 Front'].length; i++) {
        if (tooth22Front.contains(value.data['tooth 22 Front'][i]['Case']) ==
            false) {
          tooth22Front.add(value.data['tooth 22 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 22 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 22 Middle'].length; i++) {
        if (tooth22Middle.contains(value.data['tooth 22 Middle'][i]['Case']) ==
            false) {
          tooth22Middle.add(value.data['tooth 22 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 22 Back'] != null) {
      for (var i = 0; i < value.data['tooth 22 Back'].length; i++) {
        if (tooth22Back.contains(value.data['tooth 22 Back'][i]['Case']) ==
            false) {
          tooth22Back.add(value.data['tooth 22 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth22Front.isNotEmpty) {
    if (tooth22Middle.isNotEmpty) {
      if (tooth22Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth22Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth22Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth22Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth22CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth22Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth22Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth22CardDetail()));
        },
      );
    } else if (tooth22Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth22Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth22Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth22CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth22Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth22CardDetail()));
        },
      );
    }
  } else if (tooth22Middle.isNotEmpty) {
    if (tooth22Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth22Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth22Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth22CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth22Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth22CardDetail()));
        },
      );
    }
  } else if (tooth22Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth22Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth22CardDetail()));
      },
    );
  }
  if (tooth22Front.isEmpty || tooth22Middle.isEmpty || tooth22Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth23Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 23 Front'] != null) {
      for (var i = 0; i < value.data['tooth 23 Front'].length; i++) {
        if (tooth23Front.contains(value.data['tooth 23 Front'][i]['Case']) ==
            false) {
          tooth23Front.add(value.data['tooth 23 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 23 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 23 Middle'].length; i++) {
        if (tooth23Middle.contains(value.data['tooth 23 Middle'][i]['Case']) ==
            false) {
          tooth23Middle.add(value.data['tooth 23 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 23 Back'] != null) {
      for (var i = 0; i < value.data['tooth 23 Back'].length; i++) {
        if (tooth23Back.contains(value.data['tooth 23 Back'][i]['Case']) ==
            false) {
          tooth23Back.add(value.data['tooth 23 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth23Front.isNotEmpty) {
    if (tooth23Middle.isNotEmpty) {
      if (tooth23Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth23Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth23Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth23Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth23CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth23Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth23Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth23CardDetail()));
        },
      );
    } else if (tooth23Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth23Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth23Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth23CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth23Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth23CardDetail()));
        },
      );
    }
  } else if (tooth23Middle.isNotEmpty) {
    if (tooth23Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth23Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth23Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth23CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth23Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth23CardDetail()));
        },
      );
    }
  } else if (tooth23Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth23Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth23CardDetail()));
      },
    );
  }
  if (tooth23Front.isEmpty || tooth23Middle.isEmpty || tooth23Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth24Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 24 Front'] != null) {
      for (var i = 0; i < value.data['tooth 24 Front'].length; i++) {
        if (tooth24Front.contains(value.data['tooth 24 Front'][i]['Case']) ==
            false) {
          tooth24Front.add(value.data['tooth 24 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 24 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 24 Middle'].length; i++) {
        if (tooth24Middle.contains(value.data['tooth 24 Middle'][i]['Case']) ==
            false) {
          tooth24Middle.add(value.data['tooth 24 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 24 Back'] != null) {
      for (var i = 0; i < value.data['tooth 24 Back'].length; i++) {
        if (tooth24Back.contains(value.data['tooth 24 Back'][i]['Case']) ==
            false) {
          tooth24Back.add(value.data['tooth 24 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth24Front.isNotEmpty) {
    if (tooth24Middle.isNotEmpty) {
      if (tooth24Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth24Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth24Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth24Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth24CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth24Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth24Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth24CardDetail()));
        },
      );
    } else if (tooth24Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth24Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth24Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth24CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth24Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth24CardDetail()));
        },
      );
    }
  } else if (tooth24Middle.isNotEmpty) {
    if (tooth24Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth24Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth24Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth24CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth24Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth24CardDetail()));
        },
      );
    }
  } else if (tooth24Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth24Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth24CardDetail()));
      },
    );
  }
  if (tooth24Front.isEmpty || tooth24Middle.isEmpty || tooth24Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth25Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 25 Front'] != null) {
      for (var i = 0; i < value.data['tooth 25 Front'].length; i++) {
        if (tooth25Front.contains(value.data['tooth 25 Front'][i]['Case']) ==
            false) {
          tooth25Front.add(value.data['tooth 25 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 25 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 25 Middle'].length; i++) {
        if (tooth25Middle.contains(value.data['tooth 25 Middle'][i]['Case']) ==
            false) {
          tooth25Middle.add(value.data['tooth 25 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 25 Back'] != null) {
      for (var i = 0; i < value.data['tooth 25 Back'].length; i++) {
        if (tooth25Back.contains(value.data['tooth 25 Back'][i]['Case']) ==
            false) {
          tooth25Back.add(value.data['tooth 25 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth25Front.isNotEmpty) {
    if (tooth25Middle.isNotEmpty) {
      if (tooth25Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth25Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth25Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth25Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth25CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth25Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth25Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth25CardDetail()));
        },
      );
    } else if (tooth25Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth25Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth25Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth25CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth25Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth25CardDetail()));
        },
      );
    }
  } else if (tooth25Middle.isNotEmpty) {
    if (tooth25Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth25Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth25Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth25CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth25Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth25CardDetail()));
        },
      );
    }
  } else if (tooth25Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth25Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth25CardDetail()));
      },
    );
  }
  if (tooth25Front.isEmpty || tooth25Middle.isEmpty || tooth25Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth26Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 26 Front'] != null) {
      for (var i = 0; i < value.data['tooth 26 Front'].length; i++) {
        if (tooth26Front.contains(value.data['tooth 26 Front'][i]['Case']) ==
            false) {
          tooth26Front.add(value.data['tooth 26 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 26 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 26 Middle'].length; i++) {
        if (tooth26Middle.contains(value.data['tooth 26 Middle'][i]['Case']) ==
            false) {
          tooth26Middle.add(value.data['tooth 26 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 26 Back'] != null) {
      for (var i = 0; i < value.data['tooth 26 Back'].length; i++) {
        if (tooth26Back.contains(value.data['tooth 26 Back'][i]['Case']) ==
            false) {
          tooth26Back.add(value.data['tooth 26 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth26Front.isNotEmpty) {
    if (tooth26Middle.isNotEmpty) {
      if (tooth26Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth26Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth26Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth26Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth26CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth26Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth26Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth26CardDetail()));
        },
      );
    } else if (tooth26Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth26Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth26Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth26CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth26Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth26CardDetail()));
        },
      );
    }
  } else if (tooth26Middle.isNotEmpty) {
    if (tooth26Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth26Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth26Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth26CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth26Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth26CardDetail()));
        },
      );
    }
  } else if (tooth26Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth26Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth26CardDetail()));
      },
    );
  }
  if (tooth26Front.isEmpty || tooth26Middle.isEmpty || tooth26Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth27Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 27 Front'] != null) {
      for (var i = 0; i < value.data['tooth 27 Front'].length; i++) {
        if (tooth27Front.contains(value.data['tooth 27 Front'][i]['Case']) ==
            false) {
          tooth27Front.add(value.data['tooth 27 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 27 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 27 Middle'].length; i++) {
        if (tooth27Middle.contains(value.data['tooth 27 Middle'][i]['Case']) ==
            false) {
          tooth27Middle.add(value.data['tooth 27 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 27 Back'] != null) {
      for (var i = 0; i < value.data['tooth 27 Back'].length; i++) {
        if (tooth27Back.contains(value.data['tooth 27 Back'][i]['Case']) ==
            false) {
          tooth27Back.add(value.data['tooth 27 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth27Front.isNotEmpty) {
    if (tooth27Middle.isNotEmpty) {
      if (tooth27Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth27Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth27Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth27Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth27CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth27Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth27Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth27CardDetail()));
        },
      );
    } else if (tooth27Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth27Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth27Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth27CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth27Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth27CardDetail()));
        },
      );
    }
  } else if (tooth27Middle.isNotEmpty) {
    if (tooth27Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth27Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth27Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth27CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth27Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth27CardDetail()));
        },
      );
    }
  } else if (tooth27Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth27Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth27CardDetail()));
      },
    );
  }
  if (tooth27Front.isEmpty || tooth27Middle.isEmpty || tooth27Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth28Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 28 Front'] != null) {
      for (var i = 0; i < value.data['tooth 28 Front'].length; i++) {
        if (tooth28Front.contains(value.data['tooth 28 Front'][i]['Case']) ==
            false) {
          tooth28Front.add(value.data['tooth 28 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 28 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 28 Middle'].length; i++) {
        if (tooth28Middle.contains(value.data['tooth 28 Middle'][i]['Case']) ==
            false) {
          tooth28Middle.add(value.data['tooth 28 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 28 Back'] != null) {
      for (var i = 0; i < value.data['tooth 28 Back'].length; i++) {
        if (tooth28Back.contains(value.data['tooth 28 Back'][i]['Case']) ==
            false) {
          tooth28Back.add(value.data['tooth 28 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth28Front.isNotEmpty) {
    if (tooth28Middle.isNotEmpty) {
      if (tooth28Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth28Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth28Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth28Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth28CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth28Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth28Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth28CardDetail()));
        },
      );
    } else if (tooth28Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth28Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth28Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth28CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth28Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth28CardDetail()));
        },
      );
    }
  } else if (tooth28Middle.isNotEmpty) {
    if (tooth28Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth28Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth28Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth28CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth28Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth28CardDetail()));
        },
      );
    }
  } else if (tooth28Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth28Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth28CardDetail()));
      },
    );
  }
  if (tooth28Front.isEmpty || tooth28Middle.isEmpty || tooth28Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth29Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 29 Front'] != null) {
      for (var i = 0; i < value.data['tooth 29 Front'].length; i++) {
        if (tooth29Front.contains(value.data['tooth 29 Front'][i]['Case']) ==
            false) {
          tooth29Front.add(value.data['tooth 29 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 29 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 29 Middle'].length; i++) {
        if (tooth29Middle.contains(value.data['tooth 29 Middle'][i]['Case']) ==
            false) {
          tooth29Middle.add(value.data['tooth 29 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 29 Back'] != null) {
      for (var i = 0; i < value.data['tooth 29 Back'].length; i++) {
        if (tooth29Back.contains(value.data['tooth 29 Back'][i]['Case']) ==
            false) {
          tooth29Back.add(value.data['tooth 29 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth29Front.isNotEmpty) {
    if (tooth29Middle.isNotEmpty) {
      if (tooth29Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth29Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth29Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth29Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth29CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth29Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth29Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth29CardDetail()));
        },
      );
    } else if (tooth29Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth29Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth29Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth29CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth29Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth29CardDetail()));
        },
      );
    }
  } else if (tooth29Middle.isNotEmpty) {
    if (tooth29Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth29Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth29Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth29CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth29Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth29CardDetail()));
        },
      );
    }
  } else if (tooth29Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth29Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth29CardDetail()));
      },
    );
  }
  if (tooth29Front.isEmpty || tooth29Middle.isEmpty || tooth29Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth30Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 30 Front'] != null) {
      for (var i = 0; i < value.data['tooth 30 Front'].length; i++) {
        if (tooth30Front.contains(value.data['tooth 30 Front'][i]['Case']) ==
            false) {
          tooth30Front.add(value.data['tooth 30 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 30 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 30 Middle'].length; i++) {
        if (tooth30Middle.contains(value.data['tooth 30 Middle'][i]['Case']) ==
            false) {
          tooth30Middle.add(value.data['tooth 30 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 30 Back'] != null) {
      for (var i = 0; i < value.data['tooth 30 Back'].length; i++) {
        if (tooth30Back.contains(value.data['tooth 30 Back'][i]['Case']) ==
            false) {
          tooth30Back.add(value.data['tooth 30 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth30Front.isNotEmpty) {
    if (tooth30Middle.isNotEmpty) {
      if (tooth30Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth30Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth30Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth30Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth30CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth30Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth30Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth30CardDetail()));
        },
      );
    } else if (tooth30Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth30Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth30Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth30CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth30Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth30CardDetail()));
        },
      );
    }
  } else if (tooth30Middle.isNotEmpty) {
    if (tooth30Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth30Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth30Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth30CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth30Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth30CardDetail()));
        },
      );
    }
  } else if (tooth30Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth30Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth30CardDetail()));
      },
    );
  }
  if (tooth30Front.isEmpty || tooth30Middle.isEmpty || tooth30Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth31Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 31 Front'] != null) {
      for (var i = 0; i < value.data['tooth 31 Front'].length; i++) {
        if (tooth31Front.contains(value.data['tooth 31 Front'][i]['Case']) ==
            false) {
          tooth31Front.add(value.data['tooth 31 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 31 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 31 Middle'].length; i++) {
        if (tooth31Middle.contains(value.data['tooth 31 Middle'][i]['Case']) ==
            false) {
          tooth31Middle.add(value.data['tooth 31 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 31 Back'] != null) {
      for (var i = 0; i < value.data['tooth 31 Back'].length; i++) {
        if (tooth31Back.contains(value.data['tooth 31 Back'][i]['Case']) ==
            false) {
          tooth31Back.add(value.data['tooth 31 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth31Front.isNotEmpty) {
    if (tooth31Middle.isNotEmpty) {
      if (tooth31Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth31Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth31Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth31Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth31CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth31Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth31Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth31CardDetail()));
        },
      );
    } else if (tooth31Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth31Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth31Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth31CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth31Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth31CardDetail()));
        },
      );
    }
  } else if (tooth31Middle.isNotEmpty) {
    if (tooth31Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth31Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth31Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth31CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth31Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth31CardDetail()));
        },
      );
    }
  } else if (tooth31Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth31Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth31CardDetail()));
      },
    );
  }
  if (tooth31Front.isEmpty || tooth31Middle.isEmpty || tooth31Back.isEmpty) {
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
          ],
        ),
      ),
    );
  }
}

dentailHistoryTooth32Card(BuildContext context) {
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
  collectionReference.document('dentalCase').get().then((value) {
    if (value.data['tooth 32 Front'] != null) {
      for (var i = 0; i < value.data['tooth 32 Front'].length; i++) {
        if (tooth32Front.contains(value.data['tooth 32 Front'][i]['Case']) ==
            false) {
          tooth32Front.add(value.data['tooth 32 Front'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 32 Middle'] != null) {
      for (var i = 0; i < value.data['tooth 32 Middle'].length; i++) {
        if (tooth32Middle.contains(value.data['tooth 32 Middle'][i]['Case']) ==
            false) {
          tooth32Middle.add(value.data['tooth 32 Middle'][i]['Case']);
        }
      }
    }
    if (value.data['tooth 32 Back'] != null) {
      for (var i = 0; i < value.data['tooth 32 Back'].length; i++) {
        if (tooth32Back.contains(value.data['tooth 32 Back'][i]['Case']) ==
            false) {
          tooth32Back.add(value.data['tooth 32 Back'][i]['Case']);
        }
      }
    }
  });

  if (tooth32Front.isNotEmpty) {
    if (tooth32Middle.isNotEmpty) {
      if (tooth32Back.isNotEmpty) {
        return GestureDetector(
          child: Container(
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
                    'Front : ' + tooth32Front.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : ' + tooth32Middle.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : ' + tooth32Back.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => tooth32CardDetail()));
          },
        );
      }
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth32Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Middle : ' + tooth32Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth32CardDetail()));
        },
      );
    } else if (tooth32Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth32Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth32Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth32CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Front : ' + tooth32Front.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth32CardDetail()));
        },
      );
    }
  } else if (tooth32Middle.isNotEmpty) {
    if (tooth32Back.isNotEmpty) {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth32Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                Text('                            '),
                Text(
                  'Back : ' + tooth32Back.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth32CardDetail()));
        },
      );
    } else {
      return GestureDetector(
        child: Container(
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
                  'Middle : ' + tooth32Middle.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => tooth32CardDetail()));
        },
      );
    }
  } else if (tooth32Back.isNotEmpty) {
    return GestureDetector(
      child: Container(
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
                'Back : ' + tooth32Back.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => tooth32CardDetail()));
      },
    );
  }
  if (tooth32Front.isEmpty || tooth32Middle.isEmpty || tooth32Back.isEmpty) {
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
