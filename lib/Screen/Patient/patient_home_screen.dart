import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

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
                children: <Widget>[
                  Text(
                    "Welcome, ",
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                    textAlign: TextAlign.left,
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
                    ..._selectedEvents.map((event) => ListTile(
                          title: Text(event),
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: showAddDialog,
      ),
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
