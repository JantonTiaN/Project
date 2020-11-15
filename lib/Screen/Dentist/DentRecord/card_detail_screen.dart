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
}

tooth1CardDetail() {
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
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                              .data['tooth 1'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 1'][index]['Date']),
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
                                title: const Text('Warning'),
                                content: Text(
                                  'Do you finish this case?',
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                  ),
                                  FlatButton(
                                      child: Text('Yes'),
                                      onPressed: () {
                                        DateTime _currentDate =
                                            new DateTime.now();
                                        String date = snapshot.data.documents[0]
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
                                            .data['tooth 1'][index]['Position']
                                            .toString();
                                        String detail = snapshot
                                            .data
                                            .documents[0]
                                            .data['tooth 1'][index]['Detail']
                                            .toString();
                                        String status = 'Finish';
                                        Map map = ({
                                          'Date': _currentDate
                                              .toString()
                                              .substring(
                                                  0,
                                                  _currentDate
                                                          .toString()
                                                          .length -
                                                      16),
                                          'Dentist': dentist,
                                          'Position': position,
                                          'Status': status,
                                          'Detail': detail
                                        });
                                        recordHistory.add(map);
                                        toothFinish();
                                        tooth1delete(date);
                                        case1(date);
                                        tooth1Count--;
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
                                title: const Text('Warning'),
                                content: Text(
                                  'Are you sure you want to delete this dental case?',
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                  ),
                                  FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
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
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                              .data['tooth 2'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 2'][index]['Date']),
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
                                title: const Text('Warning'),
                                content: Text(
                                  'Do you finish this case?',
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                  ),
                                  FlatButton(
                                      child: Text('Yes'),
                                      onPressed: () {
                                        DateTime _currentDate =
                                            new DateTime.now();
                                        String date = snapshot.data.documents[0]
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
                                            .data['tooth 2'][index]['Position']
                                            .toString();
                                        String detail = snapshot
                                            .data
                                            .documents[0]
                                            .data['tooth 2'][index]['Detail']
                                            .toString();
                                        String status = 'Finish';
                                        Map map = ({
                                          'Date': _currentDate
                                              .toString()
                                              .substring(
                                                  0,
                                                  _currentDate
                                                          .toString()
                                                          .length -
                                                      16),
                                          'Dentist': dentist,
                                          'Position': position,
                                          'Status': status,
                                          'Detail': detail
                                        });
                                        recordHistory.add(map);
                                        toothFinish();
                                        tooth2delete(date);
                                        case2(date);
                                        tooth2Count--;
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
                                title: const Text('Warning'),
                                content: Text(
                                  'Are you sure you want to delete this dental case?',
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                  ),
                                  FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
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
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                              .data['tooth 3'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 3'][index]['Date']),
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
                                title: const Text('Warning'),
                                content: Text(
                                  'Do you finish this case?',
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                  ),
                                  FlatButton(
                                      child: Text('Yes'),
                                      onPressed: () {
                                        DateTime _currentDate =
                                            new DateTime.now();
                                        String date = snapshot.data.documents[0]
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
                                            .data['tooth 3'][index]['Position']
                                            .toString();
                                        String detail = snapshot
                                            .data
                                            .documents[0]
                                            .data['tooth 3'][index]['Detail']
                                            .toString();
                                        String status = 'Finish';
                                        Map map = ({
                                          'Date': _currentDate
                                              .toString()
                                              .substring(
                                                  0,
                                                  _currentDate
                                                          .toString()
                                                          .length -
                                                      16),
                                          'Dentist': dentist,
                                          'Position': position,
                                          'Status': status,
                                          'Detail': detail
                                        });
                                        recordHistory.add(map);
                                        toothFinish();
                                        tooth3delete(date);
                                        case3(date);
                                        tooth3Count--;
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
                                title: const Text('Warning'),
                                content: Text(
                                  'Are you sure you want to delete this dental case?',
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                  ),
                                  FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
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
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                              .data['tooth 4'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 4'][index]['Date']),
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
                                title: const Text('Warning'),
                                content: Text(
                                  'Do you finish this case?',
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                  ),
                                  FlatButton(
                                      child: Text('Yes'),
                                      onPressed: () {
                                        DateTime _currentDate =
                                            new DateTime.now();
                                        String date = snapshot.data.documents[0]
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
                                            .data['tooth 4'][index]['Position']
                                            .toString();
                                        String detail = snapshot
                                            .data
                                            .documents[0]
                                            .data['tooth 4'][index]['Detail']
                                            .toString();
                                        String status = 'Finish';
                                        Map map = ({
                                          'Date': _currentDate
                                              .toString()
                                              .substring(
                                                  0,
                                                  _currentDate
                                                          .toString()
                                                          .length -
                                                      16),
                                          'Dentist': dentist,
                                          'Position': position,
                                          'Status': status,
                                          'Detail': detail
                                        });
                                        recordHistory.add(map);
                                        toothFinish();
                                        tooth4delete(date);
                                        case4(date);
                                        tooth4Count--;
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
                                title: const Text('Warning'),
                                content: Text(
                                  'Are you sure you want to delete this dental case?',
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('No'),
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                  ),
                                  FlatButton(
                                      child: Text('OK'),
                                      onPressed: () {
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
      .document('history');
  documentReference.updateData({'history': recordHistory});
}

deleteFromHistory(String date) {
  for (var i = 0; i < recordHistory.length; i++) {
    if (recordHistory[i]['Date'] == date) {
      recordHistory.removeAt(i);
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
      .document('history');
  documentReference.updateData({'history': recordHistory});
}

String uid;
void patientUid(String patientUid) {
  uid = patientUid;
}
