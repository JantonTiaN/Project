import 'package:cloud_firestore/cloud_firestore.dart';
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
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  DateTime _currentDate = new DateTime.now();
  // final formatDate = new DateFormat('dd-MM-yyyy');
  TextEditingController _drugallergyController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  // TextEditingController _birthdateController = TextEditingController();
  // final GlobalKey<FormFieldState<String>> _passwordFieldKey = GlobalKey<FormFieldState<String>>();

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

  void _signUpUser(String email, String password, BuildContext context,
      String fullName) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString =
          await _currentUser.signUpUser(email, password, fullName);
      if (_returnString == 'success') {
        Navigator.pop(context);
      } else {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(_returnString),
          duration: Duration(seconds: 2),
        ));
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
                    // controller: ,
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
                    // controller: ,
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
              "Availiable Working Timetable",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
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
                Checkbox(
                  tristate: true,
                    value: null,
                    onChanged: null),
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
                Checkbox(
                  tristate: true,
                    value: null,
                    onChanged: null),
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
                    if (_fullNameController.text.isEmpty ||
                        _emailController.text.isEmpty ||
                        _passwordController.text.isEmpty ||
                        _confirmpasswordController.text.isEmpty ||
                        _telController.text.isEmpty ||
                        _drugallergyController.text.isEmpty) {
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
                            _confirmpasswordController.text ||
                        _emailController.text == '#@#.com') {
                      _signUpUser(
                          _emailController.text,
                          _passwordController.text,
                          context,
                          _fullNameController.text);
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                content: Text('Successful'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('Done'),
                                    onPressed: () => Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SignInScreen();
                                    })),
                                  )
                                ],
                              ));
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
