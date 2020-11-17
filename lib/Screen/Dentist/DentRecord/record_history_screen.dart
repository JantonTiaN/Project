import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentalRecord.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';

class RecordHistoryScreen extends StatefulWidget {
  @override
  _RecordHistoryScreenState createState() => _RecordHistoryScreenState();
}

class _RecordHistoryScreenState extends State<RecordHistoryScreen> {
  List alldata = [];

  @override
  void initState() {
    super.initState();
    getClinic();
  }

  List<Widget> containers = [
    Container(
      color: Colors.pink,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
              title: Text('History'),
              backgroundColor: Colors.blue[300],
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(text: 'On Progress'),
                  Tab(
                    text: 'Finished',
                  )
                ],
                indicatorColor: Colors.white,
                indicatorWeight: 4,
                labelColor: Colors.white,
                // unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
              )),
          body: TabBarView(
            children: [
              StreamBuilder(
                stream: Firestore.instance
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
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  } else if (snapshot.data.documents[0].data['history'] ==
                      null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '0 history record(s) found',
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
                      itemCount:
                          snapshot.data.documents[0].data['history'].length,
                      itemBuilder: (context, index) {
                        final idx = index + 1;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '   $idx ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Case: ' +
                                            snapshot.data.documents[0]
                                                    .data['history'][index]
                                                ['Detail']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['history'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['history'][index]
                                                ['Dentist']),
                                        Text(
                                          'Status: ' +
                                              snapshot.data.documents[0]
                                                      .data['history'][index]
                                                  ['Status'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              StreamBuilder(
                stream: Firestore.instance
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
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  } else if (snapshot.data.documents[0].data['history'] ==
                      null) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '0 history record(s) found',
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
                      itemCount:
                          snapshot.data.documents[0].data['history'].length,
                      itemBuilder: (context, index) {
                        final idx = index + 1;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    '   $idx ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Case: ' +
                                            snapshot.data.documents[0]
                                                    .data['history'][index]
                                                ['Detail']),
                                        Text('Date: ' +
                                            snapshot.data.documents[0]
                                                    .data['history'][index]
                                                ['Date']),
                                        Text('Dentist: ' +
                                            snapshot.data.documents[0]
                                                    .data['history'][index]
                                                ['Dentist']),
                                        Text(
                                          'Status: ' +
                                              snapshot.data.documents[0]
                                                      .data['history'][index]
                                                  ['Status'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          )),
    );
  }
}

String uid;
void getuserid(String getuserid) {
  uid = getuserid;
}
