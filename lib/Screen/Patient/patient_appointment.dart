import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class PatientAppointmentScreen extends StatefulWidget {
  @override
  _PatientAppointmentScreenState createState() =>
      _PatientAppointmentScreenState();
}

class _PatientAppointmentScreenState extends State<PatientAppointmentScreen> {
  CalendarController _calendarController = CalendarController();
  @override
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
