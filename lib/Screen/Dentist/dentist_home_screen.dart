import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DentHomeScreen extends StatefulWidget {
  final FirebaseUser user;
  DentHomeScreen(this.user, {Key key}) : super(key: key);

  @override
  _DentHomeScreenState createState() => _DentHomeScreenState();
}

class _DentHomeScreenState extends State<DentHomeScreen> {
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
                    "Your Plans Today",
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
                      // headerStyle: HeaderStyle(formatButtonVisible: false),
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
    );
  }
}
