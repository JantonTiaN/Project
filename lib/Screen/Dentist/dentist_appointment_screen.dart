import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DentAppointmentScreen extends StatefulWidget {
  // final FirebaseUser user;
  // DentAppointmentScreen(this.user, {Key key}) : super(key: key);

  @override
  _DentAppointmentScreenState createState() => _DentAppointmentScreenState();
}

class _DentAppointmentScreenState extends State<DentAppointmentScreen> {
  CalendarController _calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment'),
        backgroundColor: Colors.blue[300],
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          TableCalendar(
            calendarController: _calendarController,
            availableGestures: AvailableGestures.horizontalSwipe,
            headerStyle: HeaderStyle(formatButtonVisible: false),
          )
        ],
      ),
    );
  }
}
