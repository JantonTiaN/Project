import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Patient/patient_menu_screen.dart';

class PatientHomeScreen extends StatefulWidget {
  final FirebaseUser user;
  PatientHomeScreen(this.user, {Key key}) : super(key: key);
  @override
  _PatientHomeScreenState createState() => _PatientHomeScreenState();
}

class _PatientHomeScreenState extends State<PatientHomeScreen> {
  Firestore _firebase = Firestore.instance;
  CalendarController _calendarController = CalendarController();
  CalendarFormat _calendarFormat = CalendarFormat.week;
  Map<DateTime, List<dynamic>> _events = {};
  List<dynamic> _selectedEvents = [];
  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getClinic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.blue[800],
          Colors.blue[400],
          Colors.blue[300]
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 60),
            Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome, ",
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.user.displayName,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    TableCalendar(
                      calendarController: _calendarController,
                      events: _events,
                      availableGestures: AvailableGestures.horizontalSwipe,
                      headerStyle: HeaderStyle(formatButtonVisible: false),
                      initialCalendarFormat: _calendarFormat,
                      calendarStyle: CalendarStyle(
                          todayColor: Colors.blue[200],
                          selectedColor: Colors.blue[600]),
                      onDaySelected: (date, events) {
                        setState(() {
                          _selectedEvents = events;
                        });
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
                          .document(widget.user.uid)
                          .collection('Appointment')
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SpinKitChasingDots(
                                  color: Colors.blue[100],
                                  size: 50,
                                ),
                                Text(
                                  'Loading...',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                )
                              ],
                            ),
                          );
                        } else if (snapshot.data.documents[0].data.length ==
                            0) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // Image.asset(
                                //   'assets/images/Logo/No-data.png',
                                //   width: 150,
                                //   height: 150,
                                // ),
                                // Text(
                                //   'Oh...',
                                //   style: TextStyle(
                                //       fontFamily: 'Kanit',
                                //       color: Colors.blue[300],
                                //       fontSize: 25),
                                // ),
                                Text(
                                  'Nothing planned',
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
                            itemCount: snapshot.data.documents[0].data.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: <Widget>[
                                  ListTile(
                                    leading: Text('$index'),
                                    title: Text(snapshot.data.documents[0]
                                        .data['history'][index]['detail']),
                                    // subtitle: Text(snapshot.data.documents[0]
                                    //     .data['history'][index]['detail']),
                                  ),
                                  Text('Responsible by: ' +
                                      snapshot.data.documents[0].data['history']
                                          [index]['dentist']),
                                ],
                              );
                            },
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(Icons.add),
      //   onPressed: showAddDialog,
      // ),
    );
  }

  showAddDialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: _eventController,
                decoration: InputDecoration(),
              ),
              actions: <Widget>[
                FlatButton(
                    onPressed: () {
                      if (_eventController.text.isEmpty) return;
                      setState(() {
                        if (_events[_calendarController.selectedDay] != null) {
                          _events[_calendarController.selectedDay]
                              .add(_eventController.text);
                        } else {
                          _events[_calendarController.selectedDay] = [
                            _eventController.text
                          ];
                        }
                        _eventController.clear();
                        Navigator.pop(context);
                      });
                    },
                    child: Text('Save'))
              ],
            ));
  }
}
