import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentalRecord.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail1_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail2_screen.dart';

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

  tooth1CardDetail() {
    return Scaffold(
      appBar: AppBar(
        title: Text('Case Detail'),
        backgroundColor: Colors.blue[300],
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
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
            } else if (snapshot.data.documents[0].data['tooth 1'].length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth1Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 1']
                                        [index]['Position'],
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
                                                    .data['tooth 1'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 1'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 1'][index]
                                                ['Dentist']),
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
                                              .data['tooth 1'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 1'][index]['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 1'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 1'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 1'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth1Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth1Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth1Back.remove(cases);
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
                                          tooth1delete(date);
                                          case1(date);
                                          tooth1Count--;
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
                                  .data['tooth 1'][index]['Date']
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
                                              .data['tooth 1'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 1'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth1Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth1Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth1Back.remove(cases);
                                          }
                                          tooth1delete(date);
                                          case1(date);
                                          tooth1Count--;
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

  tooth2CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 2'].length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '0 record(s) found',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth2Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 2']
                                        [index]['Position'],
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
                                                    .data['tooth 2'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 2'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 2'][index]
                                                ['Dentist']),
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
                                              .data['tooth 2'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 2'][index]['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 2'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 2'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 2'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth2Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth2Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth2Back.remove(cases);
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
                                          tooth2delete(date);
                                          case2(date);
                                          tooth2Count--;
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
                                  .data['tooth 2'][index]['Date']
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
                                              .data['tooth 2'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 2'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth2Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth2Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth2Back.remove(cases);
                                          }
                                          tooth2delete(date);
                                          case2(date);
                                          tooth2Count--;
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

  tooth3CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 3'].length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth3Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 3']
                                        [index]['Position'],
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
                                                    .data['tooth 3'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 3'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 3'][index]
                                                ['Dentist']),
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
                                              .data['tooth 3'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 3'][index]['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 3'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 3'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 3'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth3Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth3Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth3Back.remove(cases);
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
                                          tooth3delete(date);
                                          case3(date);
                                          tooth3Count--;
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
                                  .data['tooth 3'][index]['Date']
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
                                              .data['tooth 3'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 3'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth3Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth3Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth3Back.remove(cases);
                                          }
                                          tooth3delete(date);
                                          case3(date);
                                          tooth3Count--;
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

  tooth4CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 4'].length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth4Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 4']
                                        [index]['Position'],
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
                                                    .data['tooth 4'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 4'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 4'][index]
                                                ['Dentist']),
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
                                              .data['tooth 4'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 4'][index]['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 4'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 4'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 4'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth4Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth4Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth4Back.remove(cases);
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
                                          tooth4delete(date);
                                          case4(date);
                                          tooth4Count--;
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
                                  .data['tooth 4'][index]['Date']
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
                                              .data['tooth 4'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 4'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth4Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth4Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth4Back.remove(cases);
                                          }
                                          tooth4delete(date);
                                          case4(date);
                                          tooth4Count--;
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

  tooth5CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 5'].length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth5Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 5']
                                        [index]['Position'],
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
                                                    .data['tooth 5'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 5'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 5'][index]
                                                ['Dentist']),
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
                                              .data['tooth 5'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 5'][index]['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 5'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 5'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 5'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth5Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth5Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth5Back.remove(cases);
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
                                          tooth5delete(date);
                                          case5(date);
                                          tooth5Count--;
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
                                  .data['tooth 5'][index]['Date']
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
                                              .data['tooth 5'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 5'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth5Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth5Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth5Back.remove(cases);
                                          }
                                          tooth5delete(date);
                                          case5(date);
                                          tooth5Count--;
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

  tooth6CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 6'].length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth6Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 6']
                                        [index]['Position'],
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
                                                    .data['tooth 6'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 6'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 6'][index]
                                                ['Dentist']),
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
                                              .data['tooth 6'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 6'][index]['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 6'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 6'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 6'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth6Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth6Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth6Back.remove(cases);
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
                                          tooth6delete(date);
                                          case6(date);
                                          tooth6Count--;
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
                                  .data['tooth 6'][index]['Date']
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
                                              .data['tooth 6'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 6'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth6Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth6Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth6Back.remove(cases);
                                          }
                                          tooth6delete(date);
                                          case6(date);
                                          tooth6Count--;
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

  tooth7CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 7'].length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth7Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 7']
                                        [index]['Position'],
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
                                                    .data['tooth 7'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 7'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 7'][index]
                                                ['Dentist']),
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
                                              .data['tooth 7'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 7'][index]['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 7'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 7'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 7'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth7Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth7Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth7Back.remove(cases);
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
                                          tooth7delete(date);
                                          case7(date);
                                          tooth7Count--;
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
                                  .data['tooth 7'][index]['Date']
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
                                              .data['tooth 6'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 6'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth6Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth6Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth6Back.remove(cases);
                                          }
                                          tooth7delete(date);
                                          case7(date);
                                          tooth7Count--;
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

  tooth8CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 8'].length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth8Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 8']
                                        [index]['Position'],
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
                                                    .data['tooth 8'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 8'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 8'][index]
                                                ['Dentist']),
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
                                              .data['tooth 8'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 8'][index]['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 8'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 8'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 8'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth8Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth8Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth8Back.remove(cases);
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
                                          tooth8delete(date);
                                          case8(date);
                                          tooth8Count--;
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
                                  .data['tooth 8'][index]['Date']
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
                                              .data['tooth 8'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 8'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth8Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth8Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth8Back.remove(cases);
                                          }
                                          tooth8delete(date);
                                          case8(date);
                                          tooth8Count--;
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

  tooth9CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 9'].length == 0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth9Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 9']
                                        [index]['Position'],
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
                                                    .data['tooth 9'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 9'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 9'][index]
                                                ['Dentist']),
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
                                              .data['tooth 9'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 9'][index]['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 9'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 9'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 9'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth9Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth9Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth9Back.remove(cases);
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
                                          tooth9delete(date);
                                          case9(date);
                                          tooth9Count--;
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
                                  .data['tooth 9'][index]['Date']
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
                                              .data['tooth 9'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 9'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth9Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth9Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth9Back.remove(cases);
                                          }
                                          tooth9delete(date);
                                          case9(date);
                                          tooth9Count--;
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

  tooth10CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 10'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth10Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 10']
                                        [index]['Position'],
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
                                                    .data['tooth 10'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 10'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 10'][index]
                                                ['Dentist']),
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
                                              .data['tooth 10'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 10'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 10'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 10'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 10'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth10Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth10Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth10Back.remove(cases);
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
                                          tooth10delete(date);
                                          case10(date);
                                          tooth10Count--;
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
                                  .data['tooth 10'][index]['Date']
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
                                              .data['tooth 10'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 10'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth10Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth10Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth10Back.remove(cases);
                                          }
                                          tooth10delete(date);
                                          case10(date);
                                          tooth10Count--;
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

  tooth11CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 11'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth11Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 11']
                                        [index]['Position'],
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
                                                    .data['tooth 11'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 11'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 11'][index]
                                                ['Dentist']),
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
                                              .data['tooth 11'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 11'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 11'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 11'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 11'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth11Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth11Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth11Back.remove(cases);
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
                                          tooth11delete(date);
                                          case11(date);
                                          tooth11Count--;
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
                                  .data['tooth 11'][index]['Date']
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
                                              .data['tooth 11'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 11'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth11Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth11Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth11Back.remove(cases);
                                          }
                                          tooth11delete(date);
                                          case11(date);
                                          tooth11Count--;
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

  tooth12CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 12'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth12Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 12']
                                        [index]['Position'],
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
                                                    .data['tooth 12'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 12'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 12'][index]
                                                ['Dentist']),
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
                                              .data['tooth 12'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 12'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 12'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 12'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 12'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth12Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth12Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth12Back.remove(cases);
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
                                          tooth12delete(date);
                                          case12(date);
                                          tooth12Count--;
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
                                  .data['tooth 12'][index]['Date']
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
                                              .data['tooth 12'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 12'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth12Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth12Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth12Back.remove(cases);
                                          }
                                          tooth12delete(date);
                                          case12(date);
                                          tooth12Count--;
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

  tooth13CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 13'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth13Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 13']
                                        [index]['Position'],
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
                                                    .data['tooth 13'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 13'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 13'][index]
                                                ['Dentist']),
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
                                              .data['tooth 13'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 13'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 13'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 13'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 13'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth13Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth13Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth13Back.remove(cases);
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
                                          tooth13delete(date);
                                          case13(date);
                                          tooth13Count--;
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
                                  .data['tooth 13'][index]['Date']
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
                                              .data['tooth 13'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 13'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth13Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth13Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth13Back.remove(cases);
                                          }
                                          tooth13delete(date);
                                          case13(date);
                                          tooth13Count--;
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

  tooth14CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 14'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth14Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 14']
                                        [index]['Position'],
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
                                                    .data['tooth 14'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 14'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 14'][index]
                                                ['Dentist']),
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
                                              .data['tooth 14'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 14'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 14'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 14'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 14'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth14Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth14Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth14Back.remove(cases);
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
                                          tooth14delete(date);
                                          case14(date);
                                          tooth14Count--;
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
                                  .data['tooth 14'][index]['Date']
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
                                              .data['tooth 14'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 14'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth14Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth14Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth14Back.remove(cases);
                                          }
                                          tooth14delete(date);
                                          case14(date);
                                          tooth14Count--;
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

  tooth15CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 15'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth15Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 15']
                                        [index]['Position'],
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
                                                    .data['tooth 15'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 15'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 15'][index]
                                                ['Dentist']),
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
                                              .data['tooth 15'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 15'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 15'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 15'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 15'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth15Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth15Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth15Back.remove(cases);
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
                                          tooth15delete(date);
                                          case15(date);
                                          tooth15Count--;
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
                                  .data['tooth 15'][index]['Date']
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
                                              .data['tooth 15'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 15'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth15Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth15Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth15Back.remove(cases);
                                          }
                                          tooth15delete(date);
                                          case15(date);
                                          tooth15Count--;
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

  tooth16CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 16'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth16Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 16']
                                        [index]['Position'],
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
                                                    .data['tooth 16'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 16'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 16'][index]
                                                ['Dentist']),
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
                                              .data['tooth 16'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 16'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 16'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 16'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 16'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth16Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth16Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth16Back.remove(cases);
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
                                          tooth16delete(date);
                                          case16(date);
                                          tooth16Count--;
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
                                  .data['tooth 16'][index]['Date']
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
                                              .data['tooth 16'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 16'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth16Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth16Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth16Back.remove(cases);
                                          }
                                          tooth16delete(date);
                                          case16(date);
                                          tooth16Count--;
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

  tooth17CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 17'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth17Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 17']
                                        [index]['Position'],
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
                                                    .data['tooth 17'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 17'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 17'][index]
                                                ['Dentist']),
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
                                              .data['tooth 17'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 17'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 17'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 17'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 17'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth17Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth17Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth17Back.remove(cases);
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
                                          tooth17delete(date);
                                          case17(date);
                                          tooth17Count--;
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
                                  .data['tooth 17'][index]['Date']
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
                                              .data['tooth 17'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 17'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth17Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth17Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth17Back.remove(cases);
                                          }
                                          tooth17delete(date);
                                          case17(date);
                                          tooth17Count--;
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

  tooth18CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 18'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth18Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 18']
                                        [index]['Position'],
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
                                                    .data['tooth 18'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 18'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 18'][index]
                                                ['Dentist']),
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
                                              .data['tooth 18'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 18'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 18'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 18'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 18'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth18Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth18Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth18Back.remove(cases);
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
                                          tooth18delete(date);
                                          case18(date);
                                          tooth18Count--;
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
                                  .data['tooth 18'][index]['Date']
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
                                              .data['tooth 18'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 18'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth18Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth18Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth18Back.remove(cases);
                                          }
                                          tooth18delete(date);
                                          case18(date);
                                          tooth18Count--;
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

  tooth19CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 19'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth19Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 19']
                                        [index]['Position'],
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
                                                    .data['tooth 19'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 19'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 19'][index]
                                                ['Dentist']),
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
                                              .data['tooth 19'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 19'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 19'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 19'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 19'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth19Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth19Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth19Back.remove(cases);
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
                                          tooth19delete(date);
                                          case19(date);
                                          tooth19Count--;
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
                                  .data['tooth 19'][index]['Date']
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
                                              .data['tooth '][index]['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 19'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth19Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth19Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth19Back.remove(cases);
                                          }
                                          tooth19delete(date);
                                          case19(date);
                                          tooth19Count--;
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

  tooth20CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 20'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth20Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 20']
                                        [index]['Position'],
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
                                                    .data['tooth 20'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 20'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 20'][index]
                                                ['Dentist']),
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
                                              .data['tooth 20'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 20'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 20'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 20'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 20'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth20Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth20Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth20Back.remove(cases);
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
                                          tooth20delete(date);
                                          case20(date);
                                          tooth20Count--;
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
                                  .data['tooth 20'][index]['Date']
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
                                              .data['tooth 20'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 20'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth20Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth20Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth20Back.remove(cases);
                                          }
                                          tooth20delete(date);
                                          case20(date);
                                          tooth20Count--;
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

  tooth21CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 21'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth21Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 21']
                                        [index]['Position'],
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
                                                    .data['tooth 21'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 21'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 21'][index]
                                                ['Dentist']),
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
                                              .data['tooth 21'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 21'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 21'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 21'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 21'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth21Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth21Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth21Back.remove(cases);
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
                                          tooth21delete(date);
                                          case21(date);
                                          tooth21Count--;
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
                                  .data['tooth 21'][index]['Date']
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
                                              .data['tooth 21'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 21'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth21Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth21Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth21Back.remove(cases);
                                          }
                                          tooth21delete(date);
                                          case21(date);
                                          tooth21Count--;
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

  tooth22CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 22'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth22Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 22']
                                        [index]['Position'],
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
                                                    .data['tooth 22'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 22'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 22'][index]
                                                ['Dentist']),
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
                                              .data['tooth 22'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 22'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 22'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 22'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 22'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth22Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth22Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth22Back.remove(cases);
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
                                          tooth22delete(date);
                                          case22(date);
                                          tooth22Count--;
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
                                  .data['tooth 22'][index]['Date']
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
                                              .data['tooth 22'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 22'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth22Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth22Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth22Back.remove(cases);
                                          }
                                          tooth22delete(date);
                                          case22(date);
                                          tooth22Count--;
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

  tooth23CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 23'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth23Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 23']
                                        [index]['Position'],
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
                                                    .data['tooth 23'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 23'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 23'][index]
                                                ['Dentist']),
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
                                              .data['tooth 23'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 23'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 23'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 23'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 23'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth23Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth23Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth23Back.remove(cases);
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
                                          tooth23delete(date);
                                          case23(date);
                                          tooth23Count--;
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
                                  .data['tooth 23'][index]['Date']
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
                                              .data['tooth 23'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 23'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth23Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth23Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth23Back.remove(cases);
                                          }
                                          tooth23delete(date);
                                          case23(date);
                                          tooth23Count--;
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

  tooth24CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 24'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth24Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 24']
                                        [index]['Position'],
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
                                                    .data['tooth 24'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 24'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 24'][index]
                                                ['Dentist']),
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
                                              .data['tooth 24'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 24'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 24'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 24'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 24'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth24Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth24Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth24Back.remove(cases);
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
                                          tooth24delete(date);
                                          case24(date);
                                          tooth24Count--;
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
                                  .data['tooth 24'][index]['Date']
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
                                              .data['tooth 24'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 24'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth24Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth24Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth24Back.remove(cases);
                                          }
                                          tooth24delete(date);
                                          case24(date);
                                          tooth24Count--;
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

  tooth25CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 25'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth25Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 25']
                                        [index]['Position'],
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
                                                    .data['tooth 25'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 25'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 25'][index]
                                                ['Dentist']),
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
                                              .data['tooth 25'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 25'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 25'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 25'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 25'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth25Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth25Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth25Back.remove(cases);
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
                                          tooth25delete(date);
                                          case25(date);
                                          tooth25Count--;
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
                                  .data['tooth 25'][index]['Date']
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
                                              .data['tooth 25'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 25'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth25Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth25Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth25Back.remove(cases);
                                          }
                                          tooth25delete(date);
                                          case25(date);
                                          tooth25Count--;
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

  tooth26CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 26'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth26Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 26']
                                        [index]['Position'],
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
                                                    .data['tooth 26'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 26'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 26'][index]
                                                ['Dentist']),
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
                                              .data['tooth 26'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 26'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 26'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 26'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 26'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth26Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth26Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth26Back.remove(cases);
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
                                          tooth26delete(date);
                                          case26(date);
                                          tooth26Count--;
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
                                  .data['tooth 26'][index]['Date']
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
                                              .data['tooth 26'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 26'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth26Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth26Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth26Back.remove(cases);
                                          }
                                          tooth26delete(date);
                                          case26(date);
                                          tooth26Count--;
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

  tooth27CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 27'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth27Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 27']
                                        [index]['Position'],
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
                                                    .data['tooth 27'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 27'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 27'][index]
                                                ['Dentist']),
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
                                              .data['tooth 27'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 27'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 27'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 27'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 27'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth27Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth27Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth27Back.remove(cases);
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
                                          tooth27delete(date);
                                          case27(date);
                                          tooth27Count--;
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
                                  .data['tooth 27'][index]['Date']
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
                                              .data['tooth 27'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 27'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth27Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth27Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth27Back.remove(cases);
                                          }
                                          tooth27delete(date);
                                          case27(date);
                                          tooth27Count--;
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

  tooth28CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 28'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth28Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 28']
                                        [index]['Position'],
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
                                                    .data['tooth 28'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 28'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 28'][index]
                                                ['Dentist']),
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
                                              .data['tooth 28'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 28'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 28'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 28'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 28'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth28Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth28Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth28Back.remove(cases);
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
                                          tooth28delete(date);
                                          case28(date);
                                          tooth28Count--;
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
                                  .data['tooth 28'][index]['Date']
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
                                              .data['tooth 28'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 28'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth28Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth28Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth28Back.remove(cases);
                                          }
                                          tooth28delete(date);
                                          case28(date);
                                          tooth28Count--;
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

  tooth29CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 29'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth29Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 29']
                                        [index]['Position'],
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
                                                    .data['tooth 29'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 29'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 29'][index]
                                                ['Dentist']),
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
                                              .data['tooth 29'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 29'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 29'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 29'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 29'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth29Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth29Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth29Back.remove(cases);
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
                                          tooth29delete(date);
                                          case29(date);
                                          tooth29Count--;
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
                                  .data['tooth 29'][index]['Date']
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
                                              .data['tooth 29'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 29'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth29Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth29Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth29Back.remove(cases);
                                          }
                                          tooth29delete(date);
                                          case29(date);
                                          tooth29Count--;
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

  tooth30CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 30'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth30Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 30']
                                        [index]['Position'],
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
                                                    .data['tooth 30'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 30'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 30'][index]
                                                ['Dentist']),
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
                                              .data['tooth 30'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 30'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 30'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 30'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 30'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth30Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth30Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth30Back.remove(cases);
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
                                          tooth30delete(date);
                                          case30(date);
                                          tooth30Count--;
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
                                  .data['tooth 30'][index]['Date']
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
                                              .data['tooth 30'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 30'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth30Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth30Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth30Back.remove(cases);
                                          }
                                          tooth30delete(date);
                                          case30(date);
                                          tooth30Count--;
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

  tooth31CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 31'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth31Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 31']
                                        [index]['Position'],
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
                                                    .data['tooth 31'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 31'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 31'][index]
                                                ['Dentist']),
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
                                              .data['tooth 31'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 31'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 31'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 31'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 31'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth31Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth31Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth31Back.remove(cases);
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
                                          tooth31delete(date);
                                          case31(date);
                                          tooth31Count--;
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
                                  .data['tooth 31'][index]['Date']
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
                                              .data['tooth 31'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 31'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth31Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth31Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth31Back.remove(cases);
                                          }
                                          tooth31delete(date);
                                          case31(date);
                                          tooth31Count--;
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

  tooth32CardDetail() {
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
            } else if (snapshot.data.documents[0].data['tooth 32'].length ==
                0) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/images/Logo/No-data.png',
                      width: 150,
                      height: 150,
                    ),
                    Text(
                      'Oh...',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 25),
                    ),
                    Text(
                      'Patient don\'t have any record',
                      style: TextStyle(
                          fontFamily: 'Kanit',
                          color: Colors.blue[300],
                          fontSize: 16),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: tooth32Count,
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
                                children: [
                                  Text(
                                    snapshot.data.documents[0].data['tooth 32']
                                        [index]['Position'],
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
                                                    .data['tooth 32'][index]
                                                ['Case']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 32'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['tooth 32'][index]
                                                ['Dentist']),
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
                                              .data['tooth 32'][index]['Date']
                                              .toString();
                                          String dentist = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 32'][index]
                                                  ['Dentist']
                                              .toString();
                                          String position = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 32'][index]
                                                  ['Position']
                                              .toString();
                                          String detail = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 32'][index]['Detail']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 32'][index]['Case']
                                              .toString();
                                          String status = 'Finised';
                                          if (position == 'Front') {
                                            tooth32Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth32Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth32Back.remove(cases);
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
                                          tooth32delete(date);
                                          case32(date);
                                          tooth32Count--;
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
                                  .data['tooth 32'][index]['Date']
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
                                              .data['tooth 32'][index]
                                                  ['Position']
                                              .toString();
                                          String cases = snapshot
                                              .data
                                              .documents[0]
                                              .data['tooth 32'][index]['Case']
                                              .toString();
                                          if (position == 'Front') {
                                            tooth32Front.remove(cases);
                                          }
                                          if (position == 'Middle') {
                                            tooth32Middle.remove(cases);
                                          }
                                          if (position == 'Back') {
                                            tooth32Back.remove(cases);
                                          }
                                          tooth32delete(date);
                                          case32(date);
                                          tooth32Count--;
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

  tooth1delete(String date) {
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
    for (var i = 0; i < tooth1.length; i++) {
      if (tooth1[i]['Date'] == date) {
        tooth1.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 1': tooth1});
  }

  tooth2delete(String date) {
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
    for (var i = 0; i < tooth2.length; i++) {
      if (tooth2[i]['Date'] == date) {
        tooth2.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 2': tooth2});
  }

  tooth3delete(String date) {
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
    for (var i = 0; i < tooth3.length; i++) {
      if (tooth3[i]['Date'] == date) {
        tooth3.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 3': tooth3});
  }

  tooth4delete(String date) {
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
    for (var i = 0; i < tooth4.length; i++) {
      if (tooth4[i]['Date'] == date) {
        tooth4.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 4': tooth4});
  }

  tooth5delete(String date) {
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
    for (var i = 0; i < tooth5.length; i++) {
      if (tooth5[i]['Date'] == date) {
        tooth5.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 5': tooth5});
  }

  tooth6delete(String date) {
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
    for (var i = 0; i < tooth6.length; i++) {
      if (tooth6[i]['Date'] == date) {
        tooth6.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 6': tooth6});
  }

  tooth7delete(String date) {
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
    for (var i = 0; i < tooth7.length; i++) {
      if (tooth7[i]['Date'] == date) {
        tooth7delete(date).removeAt(i);
      }
    }
    documentReference.updateData({'tooth 7': tooth7});
  }

  tooth8delete(String date) {
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
    for (var i = 0; i < tooth8.length; i++) {
      if (tooth8[i]['Date'] == date) {
        tooth8.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 8': tooth8});
  }

  tooth9delete(String date) {
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
    for (var i = 0; i < tooth9.length; i++) {
      if (tooth9[i]['Date'] == date) {
        tooth9.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 9': tooth9});
  }

  tooth10delete(String date) {
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
    for (var i = 0; i < tooth10.length; i++) {
      if (tooth10[i]['Date'] == date) {
        tooth10.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 10': tooth10});
  }

  tooth11delete(String date) {
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
    for (var i = 0; i < tooth11.length; i++) {
      if (tooth11[i]['Date'] == date) {
        tooth11.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 11': tooth11});
  }

  tooth12delete(String date) {
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
    for (var i = 0; i < tooth12.length; i++) {
      if (tooth12[i]['Date'] == date) {
        tooth12.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 12': tooth12});
  }

  tooth13delete(String date) {
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
    for (var i = 0; i < tooth13.length; i++) {
      if (tooth13[i]['Date'] == date) {
        tooth13.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 13': tooth13});
  }

  tooth14delete(String date) {
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
    for (var i = 0; i < tooth14.length; i++) {
      if (tooth14[i]['Date'] == date) {
        tooth14.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 14': tooth14});
  }

  tooth15delete(String date) {
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
    for (var i = 0; i < tooth15.length; i++) {
      if (tooth15[i]['Date'] == date) {
        tooth15.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 15': tooth15});
  }

  tooth16delete(String date) {
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
    for (var i = 0; i < tooth16.length; i++) {
      if (tooth16[i]['Date'] == date) {
        tooth16.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 16': tooth16});
  }

  tooth17delete(String date) {
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
    for (var i = 0; i < tooth17.length; i++) {
      if (tooth17[i]['Date'] == date) {
        tooth17.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 17': tooth17});
  }

  tooth18delete(String date) {
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
    for (var i = 0; i < tooth18.length; i++) {
      if (tooth18[i]['Date'] == date) {
        tooth18.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 18': tooth18});
  }

  tooth19delete(String date) {
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
    for (var i = 0; i < tooth19.length; i++) {
      if (tooth19[i]['Date'] == date) {
        tooth19.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 19': tooth19});
  }

  tooth20delete(String date) {
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
    for (var i = 0; i < tooth20.length; i++) {
      if (tooth20[i]['Date'] == date) {
        tooth20.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 20': tooth20});
  }

  tooth21delete(String date) {
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
    for (var i = 0; i < tooth21.length; i++) {
      if (tooth21[i]['Date'] == date) {
        tooth21.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 21': tooth21});
  }

  tooth22delete(String date) {
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
    for (var i = 0; i < tooth22.length; i++) {
      if (tooth22[i]['Date'] == date) {
        tooth22.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 22': tooth22});
  }

  tooth23delete(String date) {
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
    for (var i = 0; i < tooth23.length; i++) {
      if (tooth23[i]['Date'] == date) {
        tooth23.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 23': tooth23});
  }

  tooth24delete(String date) {
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
    for (var i = 0; i < tooth24.length; i++) {
      if (tooth24[i]['Date'] == date) {
        tooth24.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 24': tooth24});
  }

  tooth25delete(String date) {
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
    for (var i = 0; i < tooth25.length; i++) {
      if (tooth25[i]['Date'] == date) {
        tooth25.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 25': tooth25});
  }

  tooth26delete(String date) {
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
    for (var i = 0; i < tooth26.length; i++) {
      if (tooth26[i]['Date'] == date) {
        tooth26.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 26': tooth26});
  }

  tooth27delete(String date) {
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
    for (var i = 0; i < tooth27.length; i++) {
      if (tooth27[i]['Date'] == date) {
        tooth27.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 27': tooth27});
  }

  tooth28delete(String date) {
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
    for (var i = 0; i < tooth28.length; i++) {
      if (tooth28[i]['Date'] == date) {
        tooth28.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 28': tooth28});
  }

  tooth29delete(String date) {
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
    for (var i = 0; i < tooth29.length; i++) {
      if (tooth29[i]['Date'] == date) {
        tooth29.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 29': tooth29});
  }

  tooth30delete(String date) {
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
    for (var i = 0; i < tooth30.length; i++) {
      if (tooth30[i]['Date'] == date) {
        tooth30.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 30': tooth30});
  }

  tooth31delete(String date) {
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
    for (var i = 0; i < tooth31.length; i++) {
      if (tooth31[i]['Date'] == date) {
        tooth31.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 31': tooth31});
  }

  tooth32delete(String date) {
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
    for (var i = 0; i < tooth32.length; i++) {
      if (tooth32[i]['Date'] == date) {
        tooth32.removeAt(i);
      }
    }
    documentReference.updateData({'tooth 32': tooth32});
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

String uid;
void patientUid(String patientUid) {
  uid = patientUid;
}
