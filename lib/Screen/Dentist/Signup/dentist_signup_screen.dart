import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundee/States/current_user.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../font_awesome_flutter.dart';
import '../../constants.dart';
import '../../signin_screen.dart';

class DentistSignUpScreen extends StatefulWidget {
  @override
  _DentistSignUpScreenState createState() => _DentistSignUpScreenState();
}

class _DentistSignUpScreenState extends State<DentistSignUpScreen> {
  DateTime _currentDate = new DateTime.now();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  TextEditingController _citizenidController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  TextEditingController _permissionController = TextEditingController();

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

  void _signUpDentist(
      String email,
      String password,
      BuildContext context,
      String fullName,
      String tel,
      String citizenID,
      String permission,
      String birthDate) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString = await _currentUser.signUpDentists(email, password,
          fullName, tel, citizenID, permission, birthDate, _workingTime);
      if (_returnString == 'success') {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  content: Text('Registration complete'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('OK'),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignInScreen();
                      })),
                    )
                  ],
                ));
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(_returnString),
          duration: Duration(seconds: 2),
        ));
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Text(
              _returnString,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('ตกลง'),
                onPressed: () => Navigator.pop(context, 'OK'),
              )
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    String _formattedate = new DateFormat.yMMMd().format(_currentDate);
    return Scaffold(
        body: Builder(
      builder: (context) => ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/dentist-signup-screen.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Positioned(
              child: Stack(
                children: <Widget>[
                  Positioned(
                      bottom: -10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Create New Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.person,
                    color: bPrimaryColor,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    controller: _fullNameController,
                    decoration: InputDecoration(hintText: "Fullname"),
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.mail,
                    color: bPrimaryColor,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: "Email Address"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.lock,
                    color: bPrimaryColor,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(hintText: "Password"),
                    obscureText: true,
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    controller: _confirmpasswordController,
                    decoration: InputDecoration(hintText: "Confirm Password"),
                    obscureText: true,
                  ),
                )),
              ],
            ),
          ),
          Divider(
            color: Colors.blueGrey,
            // height: 10,
            indent: 20,
            endIndent: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Personal Information",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    FontAwesomeIcons.birthdayCake,
                    color: bPrimaryColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: FlatButton(
                      textColor: Colors.black54,
                      child: Text('$_formattedate',
                          style: new TextStyle(
                              fontSize: 17, fontWeight: FontWeight.normal)),
                      onPressed: () {
                        _selectdate(context);
                      }),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    FontAwesomeIcons.pills,
                    color: bPrimaryColor,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Citizen ID"),
                    keyboardType: TextInputType.number,
                    controller: _citizenidController,
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.phone,
                    color: bPrimaryColor,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Phone Number"),
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    FontAwesomeIcons.fileMedical,
                    color: bPrimaryColor,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "ใบอนุญาตประกอบวิชาชีพเลขที่"),
                    keyboardType: TextInputType.number,
                    controller: _permissionController,
                  ),
                )),
              ],
            ),
          ),
          Divider(
            color: Colors.blueGrey,
            // height: 10,
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Checkbox(tristate: true, value: null, onChanged: null),
                Text(
                  "Evening",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
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
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Checkbox(tristate: true, value: null, onChanged: null),
                Text(
                  "Evening",
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              FittedBox(
                child: GestureDetector(
                  onTap: () {
                    if (_emailController.text.isEmpty ||
                        _passwordController.text.isEmpty ||
                        _fullNameController.text.isEmpty ||
                        _confirmpasswordController.text.isEmpty ||
                        _telController.text.isEmpty ||
                        _citizenidController.text.isEmpty ||
                        _permissionController.text.isEmpty) {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Missing'),
                          content: Text(
                            'Please fill out empty field!',
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () => Navigator.pop(context, 'OK'),
                            )
                          ],
                        ),
                      );
                    } else if (_passwordController.text ==
                        _confirmpasswordController.text) {
                      if (_citizenidController.text.length != 13) {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Error'),
                                  content: Text(
                                    'Invalid Citizen ID',
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                    )
                                  ],
                                ));
                                } else if (_telController.text.length != 10) {
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Error'),
                                  content: Text(
                                    'Invalid Phone Number',
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('OK'),
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                    )
                                  ],
                                ));
                      }
                      } else {
                        _signUpDentist(
                            _emailController.text,
                            _passwordController.text,
                            context,
                            _fullNameController.text,
                            _telController.text,
                            _citizenidController.text,
                            _permissionController.text,
                            _currentDate.toString());
                        _workingTime();
                      }
                    } else {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Error'),
                          content: Text(
                            'Please make sure your password match',
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('OK'),
                              onPressed: () => Navigator.pop(context, 'OK'),
                            )
                          ],
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: bPrimaryColor,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "SIGN UP",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
