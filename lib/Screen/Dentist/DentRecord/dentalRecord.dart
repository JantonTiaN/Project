import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/DentRecord/card_detail_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail2_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/record_history_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentist_suggestion_screen.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'dental_detail1_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail1_screen.dart';

class DentalRecord extends StatefulWidget {
  final String fullname;
  final String uid;
  DentalRecord({Key key, @required this.fullname, @required this.uid})
      : super(key: key);
  @override
  _DentalRecordState createState() => _DentalRecordState();
}

FirebaseUser user;
getUser() async {
  FirebaseUser users = await FirebaseAuth.instance.currentUser();
  user = users;
}

var onProgressHistory = new List();
var finishedHistory = new List();
String uid;

List<String> tooth1Front = new List();
List<String> tooth1Middle = new List();
List<String> tooth1Back = new List();
List<String> tooth2Front = new List();
List<String> tooth2Middle = new List();
List<String> tooth2Back = new List();
List<String> tooth3Front = new List();
List<String> tooth3Middle = new List();
List<String> tooth3Back = new List();
List<String> tooth4Front = new List();
List<String> tooth4Middle = new List();
List<String> tooth4Back = new List();
List<String> tooth5Front = new List();
List<String> tooth5Middle = new List();
List<String> tooth5Back = new List();
List<String> tooth6Front = new List();
List<String> tooth6Middle = new List();
List<String> tooth6Back = new List();
List<String> tooth7Front = new List();
List<String> tooth7Middle = new List();
List<String> tooth7Back = new List();
List<String> tooth8Front = new List();
List<String> tooth8Middle = new List();
List<String> tooth8Back = new List();
List<String> tooth9Front = new List();
List<String> tooth9Middle = new List();
List<String> tooth9Back = new List();
List<String> tooth10Front = new List();
List<String> tooth10Middle = new List();
List<String> tooth10Back = new List();
List<String> tooth11Front = new List();
List<String> tooth11Middle = new List();
List<String> tooth11Back = new List();
List<String> tooth12Front = new List();
List<String> tooth12Middle = new List();
List<String> tooth12Back = new List();
List<String> tooth13Front = new List();
List<String> tooth13Middle = new List();
List<String> tooth13Back = new List();
List<String> tooth14Front = new List();
List<String> tooth14Middle = new List();
List<String> tooth14Back = new List();
List<String> tooth15Front = new List();
List<String> tooth15Middle = new List();
List<String> tooth15Back = new List();
List<String> tooth16Front = new List();
List<String> tooth16Middle = new List();
List<String> tooth16Back = new List();
List<String> tooth17Front = new List();
List<String> tooth17Middle = new List();
List<String> tooth17Back = new List();
List<String> tooth18Front = new List();
List<String> tooth18Middle = new List();
List<String> tooth18Back = new List();
List<String> tooth19Front = new List();
List<String> tooth19Middle = new List();
List<String> tooth19Back = new List();
List<String> tooth20Front = new List();
List<String> tooth20Middle = new List();
List<String> tooth20Back = new List();
List<String> tooth21Front = new List();
List<String> tooth21Middle = new List();
List<String> tooth21Back = new List();
List<String> tooth22Front = new List();
List<String> tooth22Middle = new List();
List<String> tooth22Back = new List();
List<String> tooth23Front = new List();
List<String> tooth23Middle = new List();
List<String> tooth23Back = new List();
List<String> tooth24Front = new List();
List<String> tooth24Middle = new List();
List<String> tooth24Back = new List();
List<String> tooth25Front = new List();
List<String> tooth25Middle = new List();
List<String> tooth25Back = new List();
List<String> tooth26Front = new List();
List<String> tooth26Middle = new List();
List<String> tooth26Back = new List();
List<String> tooth27Front = new List();
List<String> tooth27Middle = new List();
List<String> tooth27Back = new List();
List<String> tooth28Front = new List();
List<String> tooth28Middle = new List();
List<String> tooth28Back = new List();
List<String> tooth29Front = new List();
List<String> tooth29Middle = new List();
List<String> tooth29Back = new List();
List<String> tooth30Front = new List();
List<String> tooth30Middle = new List();
List<String> tooth30Back = new List();
List<String> tooth31Front = new List();
List<String> tooth31Middle = new List();
List<String> tooth31Back = new List();
List<String> tooth32Front = new List();
List<String> tooth32Middle = new List();
List<String> tooth32Back = new List();

getHis() async {
  Firestore firestore = Firestore.instance;
  DocumentReference finishedDocumentReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('History')
      .document('history')
      .collection('Finished')
      .document('finished');
  finishedDocumentReference.get().then((value) => {
        if (value.data['history'] != null)
          {finishedHistory = value.data['history']}
      });
  DocumentReference onProgressDocumentReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('Clinic')
      .document('clinic')
      .collection(clinic)
      .document(clinic)
      .collection('Patients')
      .document(uid)
      .collection('History')
      .document('history')
      .collection('Finished')
      .document('finished');
  onProgressDocumentReference.get().then((value) => {
        if (value.data['history'] != null)
          {onProgressHistory = value.data['history']}
      });
}

dentalHistory() {
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
}

class _DentalRecordState extends State<DentalRecord> {
  void initState() {
    super.initState();
    suggestionuid(widget.uid);
    patientUid(widget.uid);
    detail2Uid(widget.uid);
    getuserid(widget.uid);
    getUid();
    getHis();
    dentalHistory();
    getUser();
  }

  getUid() {
    uid = widget.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.fullname),
          backgroundColor: Colors.blue[300],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                  child: Center(
                    child: Text(
                      'Upper',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 555, 0, 0),
                  child: Center(
                    child: Text(
                      'Lower',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 295, 280, 0),
                  child: Center(
                    child: Text(
                      'Right',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(280, 295, 0, 0),
                  child: Center(
                    child: Text(
                      'Left',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(290, 540, 0, 0),
                  child: FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return RecordHistoryScreen();
                          },
                        ));
                      },
                      child: Container(
                        // margin: EdgeInsets.
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(25),
                            color: Colors.amber,
                            shape: BoxShape.circle),
                        child: Row(
                          children: <Widget>[
                            // Text(
                            //   'History',
                            //   style: TextStyle(fontSize: 20),
                            // ),
                            // SizedBox(width: 10),
                            Icon(
                              Icons.history,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(240, 540, 0, 0),
                  child: FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return DentSuggestionScreen();
                          },
                        ));
                      },
                      child: Container(
                        // margin: EdgeInsets.
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(25),
                            color: Colors.amber,
                            shape: BoxShape.circle),
                        child: Row(
                          children: <Widget>[
                            // Text(
                            //   'History',
                            //   style: TextStyle(fontSize: 20),
                            // ),
                            // SizedBox(width: 10),
                            Icon(
                              LineAwesomeIcons.medical_notes,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 255, 280, 0),
                  child: Center(
                    child: Text(
                      '1',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 220, 280, 0),
                  child: Center(
                    child: Text(
                      '2',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 185, 275, 0),
                  child: Center(
                    child: Text(
                      '3',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 150, 255, 0),
                  child: Center(
                    child: Text(
                      '4',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 123, 220, 0),
                  child: Center(
                    child: Text(
                      '5',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 95, 185, 0),
                  child: Center(
                    child: Text(
                      '6',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 68, 128, 0),
                  child: Center(
                    child: Text(
                      '7',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 55, 40, 0),
                  child: Center(
                    child: Text(
                      '8',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 55, 0, 0),
                  child: Center(
                    child: Text(
                      '9',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(128, 68, 0, 0),
                  child: Center(
                    child: Text(
                      '10',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 95, 0, 0),
                  child: Center(
                    child: Text(
                      '11',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(220, 123, 0, 0),
                  child: Center(
                    child: Text(
                      '12',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(255, 150, 0, 0),
                  child: Center(
                    child: Text(
                      '13',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(275, 185, 0, 0),
                  child: Center(
                    child: Text(
                      '14',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(280, 220, 0, 0),
                  child: Center(
                    child: Text(
                      '15',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(280, 255, 0, 0),
                  child: Center(
                    child: Text(
                      '16',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(290, 345, 0, 0),
                  child: Center(
                    child: Text(
                      '17',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(280, 385, 0, 0),
                  child: Center(
                    child: Text(
                      '18',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(270, 423, 0, 0),
                  child: Center(
                    child: Text(
                      '19',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(255, 455, 0, 0),
                  child: Center(
                    child: Text(
                      '20',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(220, 485, 0, 0),
                  child: Center(
                    child: Text(
                      '21',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(170, 510, 0, 0),
                  child: Center(
                    child: Text(
                      '22',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(110, 525, 0, 0),
                  child: Center(
                    child: Text(
                      '23',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 535, 0, 0),
                  child: Center(
                    child: Text(
                      '24',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 535, 35, 0),
                  child: Center(
                    child: Text(
                      '25',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 525, 105, 0),
                  child: Center(
                    child: Text(
                      '26',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 510, 170, 0),
                  child: Center(
                    child: Text(
                      '27',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 485, 220, 0),
                  child: Center(
                    child: Text(
                      '28',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 455, 255, 0),
                  child: Center(
                    child: Text(
                      '29',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 420, 275, 0),
                  child: Center(
                    child: Text(
                      '30',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 385, 280, 0),
                  child: Center(
                    child: Text(
                      '31',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 345, 290, 0),
                  child: Center(
                    child: Text(
                      '32',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Center(
                    child: Image.asset(
                      'images/tooth/AllGum-lastest.png',
                      scale: 4.3,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth1Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 243, 200, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/1-lastest.png',
                        scale: 25,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth2Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 211, 200, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/2-lastest.png',
                        scale: 27,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth3Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 180.5, 190, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/3-lastest.png',
                        scale: 28,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth4Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 155, 175, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/4-lastest.png',
                        scale: 29,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth5Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 131, 153, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/5-lastest.png',
                        scale: 31,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth6Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 111, 115, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/6-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth7Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 91, 80, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/7-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth8Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 84, 29, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/8-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth9Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(27.5, 84, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/9-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth10Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(78, 92, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/10-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth11Detail(context)));
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(113, 110, 0, 0),
                      child: Center(
                        child: Image.asset(
                          'images/tooth/11-lastest.png',
                          scale: 34,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth12Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(143, 128.5, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/12-lastest.png',
                        scale: 31,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth13Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(172, 151.5, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/13-lastest.png',
                        scale: 29,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth14Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(185, 178, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/14-lastest.png',
                        scale: 28,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth15Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(197, 207.5, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/15-lastest.png',
                        scale: 27,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetailScreen(user)
                                .createState()
                                .tooth16Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(198, 239.5, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/16-lastest.png',
                        scale: 25,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth17Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(203, 330, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/17-lastest.png',
                        scale: 25,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth18Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(203, 370, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/18-lastest.png',
                        scale: 26,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth19Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(191, 405, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/19-lastest.png',
                        scale: 29,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth20Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(171, 435, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/20-lastest.png',
                        scale: 31,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth21Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(130, 461, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/21-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth22Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(104, 478, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/22-lastest.png',
                        scale: 39,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth23Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(74, 492, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/23-lastest.png',
                        scale: 39,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth24Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(26, 498, 00, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/24-lastest.png',
                        scale: 40,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth25Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 498, 22, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/25-lastest.png',
                        scale: 40,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth26Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 493, 69, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/26-lastest.png',
                        scale: 40,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth27Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 480, 101, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/27-lastest.png',
                        scale: 40,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth28Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 460, 134, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/28-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth29Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 431, 165, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/29-lastest.png',
                        scale: 31,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth30Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 400.5, 185, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/30-lastest.png',
                        scale: 29,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth31Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 369, 200, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/31-lastest.png',
                        scale: 27,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DentalDetail2Screen()
                                .createState()
                                .tooth32Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 330, 200, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/32-lastest.png',
                        scale: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
