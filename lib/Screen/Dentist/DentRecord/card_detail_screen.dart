import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail1_screen.dart';

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

  List tooth1FrontCases, tooth1FrontDate, tooth1FrontDentist;

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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                              .data['tooth 5'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 5'][index]['Date']),
                                      Text('Dentist: ' +
                                          snapshot.data.documents[0]
                                                  .data['tooth 5'][index]
                                              ['Dentist']),
                                    ],
                                  ),
                                )
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                              .data['tooth 6'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 6'][index]['Date']),
                                      Text('Dentist: ' +
                                          snapshot.data.documents[0]
                                                  .data['tooth 6'][index]
                                              ['Dentist']),
                                    ],
                                  ),
                                )
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                              .data['tooth 7'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 7'][index]['Date']),
                                      Text('Dentist: ' +
                                          snapshot.data.documents[0]
                                                  .data['tooth 7'][index]
                                              ['Dentist']),
                                    ],
                                  ),
                                )
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                              .data['tooth 8'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 8'][index]['Date']),
                                      Text('Dentist: ' +
                                          snapshot.data.documents[0]
                                                  .data['tooth 8'][index]
                                              ['Dentist']),
                                    ],
                                  ),
                                )
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                              .data['tooth 9'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 9'][index]['Date']),
                                      Text('Dentist: ' +
                                          snapshot.data.documents[0]
                                                  .data['tooth 9'][index]
                                              ['Dentist']),
                                    ],
                                  ),
                                )
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                              .data['tooth 10'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 10'][index]['Date']),
                                      Text('Dentist: ' +
                                          snapshot.data.documents[0]
                                                  .data['tooth 10'][index]
                                              ['Dentist']),
                                    ],
                                  ),
                                )
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                              .data['tooth 11'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 11'][index]['Date']),
                                      Text('Dentist: ' +
                                          snapshot.data.documents[0]
                                                  .data['tooth 11'][index]
                                              ['Dentist']),
                                    ],
                                  ),
                                )
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                              .data['tooth 12'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 12'][index]['Date']),
                                      Text('Dentist: ' +
                                          snapshot.data.documents[0]
                                                  .data['tooth 12'][index]
                                              ['Dentist']),
                                    ],
                                  ),
                                )
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                              .data['tooth 13'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 13'][index]['Date']),
                                      Text('Dentist: ' +
                                          snapshot.data.documents[0]
                                                  .data['tooth 13'][index]
                                              ['Dentist']),
                                    ],
                                  ),
                                )
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                              .data['tooth 14'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 14'][index]['Date']),
                                      Text('Dentist: ' +
                                          snapshot.data.documents[0]
                                                  .data['tooth 14'][index]
                                              ['Dentist']),
                                    ],
                                  ),
                                )
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                              .data['tooth 15'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 15'][index]['Date']),
                                      Text('Dentist: ' +
                                          snapshot.data.documents[0]
                                                  .data['tooth 15'][index]
                                              ['Dentist']),
                                    ],
                                  ),
                                )
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
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
          } else if (snapshot.data.documents[0].data.length == 0) {
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
                  // )
                ],
              ),
            );
          } else {
            return ListView.builder(
                itemCount: countOfCases,
                itemBuilder: (context, index) {
                  return Slidable(
                    //   key: _key,
                    //   dismissal: SlidableDismissal(
                    //     child: SlidableDrawerDismissal(),
                    //     onWillDismiss: (actionType) {
                    //       return showDialog<bool>(
                    //         context: context,
                    //         builder: (context) {
                    //           return AlertDialog(
                    //             title: Text('Delete'),
                    //             content: Text('Item will be deleted'),
                    //             actions: <Widget>[
                    //               FlatButton(
                    //                 child: Text('Cancel'),
                    //                 onPressed: () => Navigator.of(context).pop(false),
                    //               ),
                    //               FlatButton(
                    //                 child: Text('Ok'),
                    //                 onPressed: () => Navigator.of(context).pop(true),
                    //               ),
                    //             ],
                    //           );
                    //         },
                    //       );
                    //     },
                    //   ),
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
                                              .data['tooth 16'][index]['Case']),
                                      Text('Date: ' +
                                          snapshot.data.documents[0]
                                              .data['tooth 16'][index]['Date']),
                                      Text('Dentist: ' +
                                          snapshot.data.documents[0]
                                                  .data['tooth 16'][index]
                                              ['Dentist']),
                                    ],
                                  ),
                                )
                                // Text('Front: Case name'
                                //     '\nDate: 01/11/63'
                                //     '\nDentist name'),
                              ],
                            ),
                          ),
                          // child: ListTile(
                          //   title: Text('Front: Case name'),
                          //   subtitle: Text('Date: 01/11/63'),
                          //   isThreeLine: true,
                          // ),
                        ),
                      ],
                    ),
                    actions: <Widget>[
                      IconSlideAction(
                        caption: 'Done',
                        color: Colors.green,
                        icon: Icons.check,
                        // onTap: () => _showSnackBar('Saved'),
                      ),
                    ],
                    secondaryActions: <Widget>[
                      IconSlideAction(
                        caption: 'Delete',
                        color: Colors.red,
                        icon: Icons.delete,
                        // onTap: () => _showSnackBar('Delete'),
                      ),
                    ],
                  );
                });
          }
        }),
  );
}

String uid;
void patientUid(String patientUid) {
  uid = patientUid;
}
