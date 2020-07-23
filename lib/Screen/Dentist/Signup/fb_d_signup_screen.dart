import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundee/Screen/constants.dart';
import 'package:fundee/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class FbDSignupScreen extends StatefulWidget {
  final FirebaseUser user;
  FbDSignupScreen(this.user, {Key key}) : super(key: key);

  @override
  _FbDSignupScreenState createState() => _FbDSignupScreenState();
}

class _FbDSignupScreenState extends State<FbDSignupScreen> {
  DateTime _currentDate = new DateTime.now();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _drugallergyController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  TextEditingController _citizenidController = TextEditingController();
  TextEditingController _permissionController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  //value for checkbox timetable
  //mon
  bool monMorning = false;
  bool monAfternoon = false;
  bool monEvening = false;
  //tue
  bool tueMorning = false;
  bool tueAfternoon = false;
  bool tueEvening = false;
  //wed
  bool wedMorning = false;
  bool wedAfternoon = false;
  bool wedEvening = false;
  //thu
  bool thuMorning = false;
  bool thuAfternoon = false;
  bool thuEvening = false;
  //fri
  bool friMorning = false;
  bool friAfternoon = false;
  bool friEvening = false;
  //sat
  bool satMorning = false;
  bool satAfternoon = false;
  bool satEvening = false;
  //sun
  bool sunMorning = false;
  bool sunAfternoon = false;
  bool sunEvening = false;

  List _workingTime() {
    String time = '';
    var workingTime = new List();
    if (monMorning == true) {
      time = 'Monday Morning';
      workingTime.add(time);
    }
    if (monAfternoon == true) {
      time = 'Monday Afternoon';
      workingTime.add(time);
    }
    if (monEvening == true) {
      time = 'Monday Evening';
      workingTime.add(time);
    }
    if (tueMorning == true) {
      time = 'Tuesday Morning';
      workingTime.add(time);
    }
    if (tueAfternoon == true) {
      time = 'Tuesday Afternoon';
      workingTime.add(time);
    }
    if (tueEvening == true) {
      time = 'Tuesday Evening';
      workingTime.add(time);
    }
    if (wedMorning == true) {
      time = 'Wednesday Morning';
      workingTime.add(time);
    }
    if (wedAfternoon == true) {
      time = 'Wednesday Afternoon';
      workingTime.add(time);
    }
    if (wedEvening == true) {
      time = 'Wednesday Evening';
      workingTime.add(time);
    }
    if (thuMorning == true) {
      time = 'Thursday Morning';
      workingTime.add(time);
    }
    if (thuAfternoon == true) {
      time = 'Thursday Afternoon';
      workingTime.add(time);
    }
    if (thuEvening == true) {
      time = 'Thursday Evening';
      workingTime.add(time);
    }
    if (friMorning == true) {
      time = 'Friday Morning';
      workingTime.add(time);
    }
    if (friAfternoon == true) {
      time = 'Friday Afternoon';
      workingTime.add(time);
    }
    if (friEvening == true) {
      time = 'Friday Evening';
      workingTime.add(time);
    }
    if (satMorning == true) {
      time = 'Saturday Morning';
      workingTime.add(time);
    }
    if (satAfternoon == true) {
      time = 'Saturday Afternoon';
      workingTime.add(time);
    }
    // if(satAfternoon == true){
    //   time = 'Saturday Evening';
    //   _workingTime.add(time);
    // }
    if (sunMorning == true) {
      time = 'Sunday Morning';
      workingTime.add(time);
    }
    if (sunAfternoon == true) {
      time = 'Sunday Afternoon';
      workingTime.add(time);
    }
    // if(sunAfternoon == true){
    //   time = 'Sunday Evening';
    //   _workingTime.add(time);
    // }
    return workingTime;
  }

  Future<Null> _selectdate(BuildContext context) async {
    final DateTime _seldate = await showDatePicker(
        context: context,
        initialDate: _currentDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return SingleChildScrollView(
            child: child,
          );
        });
    if (_seldate != null) {
      setState(() {
        _currentDate = _seldate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String _formattedate = new DateFormat.yMMMd().format(_currentDate);

    return Scaffold(
        backgroundColor: bBackgroundColor,
        body: Builder(
            builder: (context) => ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Center(
                          child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(
                              "assets/images/Logo/Facebook-Logo.png"),
                        )),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                          child: Text(
                        "Facebook Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Center(
                          child: Text(
                        "Personal Information",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Welcome " + widget.user.displayName,
                            // "Welcome, ",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Fullname",
                                  hintStyle: TextStyle(color: Colors.blueGrey)),
                              controller: _fullnameController,
                            ),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: <Widget>[],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(FontAwesomeIcons.birthdayCake,
                                color: Colors.blue),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: FlatButton(
                                textColor: Colors.black54,
                                child: Text('$_formattedate',
                                    style: new TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.blueGrey)),
                                onPressed: () {
                                  _selectdate(context);
                                }),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              FontAwesomeIcons.solidIdCard,
                              color: Colors.blue,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Citizen ID",
                                  hintStyle: TextStyle(color: Colors.blueGrey)),
                              keyboardType: TextInputType.number,
                              controller: _citizenidController,
                            ),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.phone,
                              color: Colors.blue,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(color: Colors.blueGrey)),
                              keyboardType: TextInputType.phone,
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly,
                              ],
                              controller: _telController,
                            ),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Icon(
                              FontAwesomeIcons.fileMedical,
                              color: Colors.blue,
                            ),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "ใบอนุญาตประกอบวิชาชีพเลขที่",
                                  hintStyle: TextStyle(color: Colors.blueGrey)),
                              keyboardType: TextInputType.number,
                              controller: _permissionController,
                            ),
                          )),
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.blueGrey,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Availiable Working Timetable",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Text(
                        "*(Morning means 9.00-12.00, Afternoon means 13.00-16.00, and Evening means 16.30-20.00)*",
                        style: TextStyle(color: Colors.blueGrey, fontSize: 10),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Monday",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: monMorning,
                              onChanged: (bool value) {
                                setState(() {
                                  monMorning = value;
                                });
                              }),
                          Text(
                            "Morning",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              value: monAfternoon,
                              onChanged: (bool value) {
                                setState(() {
                                  monAfternoon = value;
                                });
                              }),
                          Text(
                            "Afternoon",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              value: monEvening,
                              onChanged: (bool value) {
                                setState(() {
                                  monEvening = value;
                                });
                              }),
                          Text(
                            "Evening",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Tuesday",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: tueMorning,
                              onChanged: (bool value) {
                                setState(() {
                                  tueMorning = value;
                                });
                              }),
                          Text(
                            "Morning",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              value: tueAfternoon,
                              onChanged: (bool value) {
                                setState(() {
                                  tueAfternoon = value;
                                });
                              }),
                          Text(
                            "Afternoon",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              value: tueEvening,
                              onChanged: (bool value) {
                                setState(() {
                                  tueEvening = value;
                                });
                              }),
                          Text(
                            "Evening",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Wednesday",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: wedMorning,
                              onChanged: (bool value) {
                                setState(() {
                                  wedMorning = value;
                                });
                              }),
                          Text(
                            "Morning",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              value: wedAfternoon,
                              onChanged: (bool value) {
                                setState(() {
                                  wedAfternoon = value;
                                });
                              }),
                          Text(
                            "Afternoon",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              value: wedEvening,
                              onChanged: (bool value) {
                                setState(() {
                                  wedEvening = value;
                                });
                              }),
                          Text(
                            "Evening",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Thursday",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: thuMorning,
                              onChanged: (bool value) {
                                setState(() {
                                  thuMorning = value;
                                });
                              }),
                          Text(
                            "Morning",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              value: thuAfternoon,
                              onChanged: (bool value) {
                                setState(() {
                                  thuAfternoon = value;
                                });
                              }),
                          Text(
                            "Afternoon",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              value: thuEvening,
                              onChanged: (bool value) {
                                setState(() {
                                  thuEvening = value;
                                });
                              }),
                          Text(
                            "Evening",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Friday",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: friMorning,
                              onChanged: (bool value) {
                                setState(() {
                                  friMorning = value;
                                });
                              }),
                          Text(
                            "Morning",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              value: friAfternoon,
                              onChanged: (bool value) {
                                setState(() {
                                  friAfternoon = value;
                                });
                              }),
                          Text(
                            "Afternoon",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              value: friEvening,
                              onChanged: (bool value) {
                                setState(() {
                                  friEvening = value;
                                });
                              }),
                          Text(
                            "Evening",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Saturday",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: satMorning,
                              onChanged: (bool value) {
                                setState(() {
                                  satMorning = value;
                                });
                              }),
                          Text(
                            "Morning",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              value: satAfternoon,
                              onChanged: (bool value) {
                                setState(() {
                                  satAfternoon = value;
                                });
                              }),
                          Text(
                            "Afternoon",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              tristate: true, value: null, onChanged: null),
                          Text(
                            "Evening",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        "Sunday",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                              value: sunMorning,
                              onChanged: (bool value) {
                                setState(() {
                                  sunMorning = value;
                                });
                              }),
                          Text(
                            "Morning",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              value: sunAfternoon,
                              onChanged: (bool value) {
                                setState(() {
                                  sunAfternoon = value;
                                });
                              }),
                          Text(
                            "Afternoon",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                          Checkbox(
                              tristate: true, value: null, onChanged: null),
                          Text(
                            "Evening",
                            style:
                                TextStyle(fontSize: 12, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        FittedBox(
                          child: GestureDetector(
                            onTap: () {
                              if (_telController.text.isEmpty ||
                                  _drugallergyController.text.isEmpty) {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    content: Text(
                                      'Please fill out all information.',
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('OK'),
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                      )
                                    ],
                                  ),
                                );
                              } else if (_telController.text.length != 10) {
                                showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    content: Text(
                                      'Please make sure your Phone Number is correct',
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        child: Text('OK'),
                                        onPressed: () =>
                                            Navigator.pop(context, 'OK'),
                                      )
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 20),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 26, vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.blue[400],
                              ),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "SIGN UP",
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )));
  }
}
