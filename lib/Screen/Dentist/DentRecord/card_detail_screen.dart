import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentalRecord.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail1_screen.dart';
import 'package:fundee/Screen/Dentist/patientList.dart';

class CardDetailScreen extends StatefulWidget {
  // final FirebaseUser user;
  // CardDetailScreen(this.user, {Key key}) : super(key: key);
  @override
  _CardDetailScreenState createState() => _CardDetailScreenState();
}

DocumentReference caseReference = firestore
    .collection('FunD')
    .document('funD')
    .collection('Clinic')
    .document('clinic')
    .collection(clinic)
    .document(clinic)
    .collection('Patients')
    .document(uid)
    .collection('DentalCase')
    .document('dentalCase');

DocumentReference caseDetailReference = firestore
    .collection('FunD')
    .document('funD')
    .collection('Clinic')
    .document('clinic')
    .collection(clinic)
    .document(clinic)
    .collection('Patients')
    .document(uid)
    .collection('DentalCase')
    .document('dentalCase')
    .collection('CaseDetail')
    .document('caseDetail');

class _CardDetailScreenState extends State<CardDetailScreen> {
  @override
  void initState() {
    super.initState();
    getClinic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Text(
          'Hello',
          style: TextStyle(color: Colors.amber, fontSize: 50),
        )
      ],
    ));
  }

  toothCardDetail(List casesFront, List casesMiddle, List casesBack, List tooth,
      List front, List middle, List back, int toothNum) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Case Detail'),
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
              .collection('DentalCase')
              .document('dentalCase')
              .collection('CaseDetail')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SpinKitChasingDots(
                      color: Colors.blue[100],
                      size: 50,
                    ),
                    Text(
                      'Loading...',
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    )
                  ],
                ),
              );
            } else if (snapshot
                    .data.documents[0].data['tooth $toothNum'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '0 dental record(s) found',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              int count =
                  snapshot.data.documents[0].data['tooth $toothNum'].length;
              return ListView.builder(
                  itemCount: count,
                  itemBuilder: (context, index) {
                    return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actionExtentRatio: 0.25,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: Card(
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    snapshot.data.documents[0]
                                            .data['tooth $toothNum'][index]
                                        ['Position'],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Case Name: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth $toothNum']
                                                [index]['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth $toothNum']
                                                [index]['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth $toothNum']
                                                [index]['Dentist']),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      actions: <Widget>[
                        IconSlideAction(
                            caption: 'Done',
                            color: Colors.green,
                            icon: Icons.check,
                            onTap: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Confirmation'),
                                  content: Text(
                                    'Do you want to finish this case?',
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('No',
                                          style: TextStyle(color: Colors.grey)),
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                    ),
                                    FlatButton(
                                        child: Text('Yes'),
                                        onPressed: () {
                                          DateTime _currentDate =
                                              new DateTime.now();
                                          String date = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth $toothNum'][index]
                                                  ['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth $toothNum'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth $toothNum'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth $toothNum'][index]
                                                  ['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth $toothNum'][index]
                                                  ['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            back.remove(cases);
                                          }
                                          Map map = ({
                                            'Date': _currentDate
                                                .toString()
                                                .substring(
                                                    0,
                                                    _currentDate
                                                            .toString()
                                                            .length -
                                                        7),
                                            'Dentist': dentist,
                                            'Position': position,
                                            'Status': status,
                                            'Detail': detail
                                          });
                                          finishedHistory.add(map);
                                          toothFinish();
                                          toothdelete(tooth, date, toothNum);
                                          reMoveCase(casesFront, casesMiddle,
                                              casesBack, date, toothNum);
                                          count--;
                                          deleteFromHistory(date);
                                          Navigator.pop(context);
                                        })
                                  ],
                                ),
                              );
                            }),
                      ],
                      secondaryActions: <Widget>[
                        IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            onTap: () {
                              String date = snapshot.data.documents[0]
                                  .data['tooth $toothNum'][index]['Date']
                                  .toString();
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Confirm Delete'),
                                  content: Text(
                                    'Are you sure you want to delete this dental case?',
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('No',
                                          style: TextStyle(color: Colors.grey)),
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                    ),
                                    FlatButton(
                                        child: Text('Delete',
                                            style:
                                                TextStyle(color: Colors.red)),
                                        onPressed: () {
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth $toothNum'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth $toothNum'][index]
                                                  ['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            back.remove(cases);
                                          }
                                          toothdelete(tooth, date, toothNum);
                                          reMoveCase(casesFront, casesMiddle,
                                              casesBack, date, toothNum);
                                          count--;
                                          deleteFromHistory(date);
                                          Navigator.pop(context);
                                        })
                                  ],
                                ),
                              );
                            }),
                      ],
                    );
                  });
            }
          }),
    );
  }

  reMoveCase(
      List caseFront, List caseMiddle, List caseBack, String date, int number) {
    for (var i = 0; i < caseFront.length; i++) {
      if (caseFront[i]['Date'] == date) {
        caseFront.removeAt(i);
      }
    }
    for (var i = 0; i < caseMiddle.length; i++) {
      if (caseMiddle[i]['Date'] == date) {
        caseMiddle.removeAt(i);
      }
    }
    for (var i = 0; i < caseBack.length; i++) {
      if (caseBack[i]['Date'] == date) {
        caseBack.removeAt(i);
      }
    }
    caseDocumentReference.updateData({
      'tooth $number Front': caseFront,
      'tooth $number Middle': caseMiddle,
      'tooth $number Back': caseBack
    });
  }

  toothdelete(List tooth, String date, int toothNum) {
    DocumentReference documentReference = Firestore.instance
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(clinic)
        .document(clinic)
        .collection('Patients')
        .document(uid)
        .collection('DentalCase')
        .document('dentalCase')
        .collection('CaseDetail')
        .document('caseDetail');
    for (var i = 0; i < tooth.length; i++) {
      if (tooth[i]['Date'] == date) {
        tooth.removeAt(i);
      }
    }
    documentReference.updateData({'tooth $toothNum': tooth});
  }

  toothFinish() {
    DocumentReference documentReference = Firestore.instance
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
    documentReference.updateData({'history': finishedHistory});
  }

  deleteFromHistory(String date) {
    for (var i = 0; i < onProgressHistory.length; i++) {
      if (onProgressHistory[i]['Date'] == date) {
        onProgressHistory.removeAt(i);
      }
    }
    DocumentReference documentReference = Firestore.instance
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
        .collection('OnProgress')
        .document('onProgress');
    documentReference.updateData({'history': onProgressHistory});
  }
}
