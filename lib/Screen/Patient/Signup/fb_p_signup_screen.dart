import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundee/Screen/constants.dart';
import 'package:fundee/States/current_user.dart';
import 'package:fundee/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../signin_screen.dart';
import '../patient_menu_screen.dart';

class FbPSignupScreen extends StatefulWidget {
  // final FirebaseUser user;
  // FbPSignupScreen(this.user, {Key key}) : super(key: key);
  @override
  _FbPSignupScreenState createState() => _FbPSignupScreenState();
}

class _FbPSignupScreenState extends State<FbPSignupScreen> {
  DateTime _currentDate = new DateTime.now();
  TextEditingController _drugallergyController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  String dropdownValue = 'Clinic 1';

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

  void _signUpPatientWithFB(BuildContext context, String tel,
      String drugallergy, String brithDate, String clinic) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString = await _currentUser.socialSignUpPatientsWithFBAndGG(
          tel, drugallergy, brithDate, clinic);
      if (_returnString == 'success') {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  content: Text('Registration complete'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('OK'),
                      onPressed: () {
                        signupComplete();
                      },
                    )
                  ],
                ));
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            content: Text(
              _returnString,
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
    } catch (e) {
      print(e);
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
                            "Welcome, ",
                            // "Welcome, " + widget.user.displayName,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 20, right: 20),
                    //   child: Row(
                    //     crossAxisAlignment: CrossAxisAlignment.center,
                    //     children: <Widget>[
                    //       Padding(
                    //         padding: const EdgeInsets.only(right: 16),
                    //         child: Icon(
                    //           Icons.person,
                    //           color: Colors.blue,
                    //         ),
                    //       ),
                    //       Expanded(
                    //           child: Container(
                    //         margin: EdgeInsets.only(right: 20, left: 10),
                    //         child: TextFormField(
                    //           decoration: InputDecoration(
                    //               hintText: "Fullname",
                    //               hintStyle: TextStyle(color: Colors.blueGrey)),
                    //           controller: _fullnameController,
                    //         ),
                    //       )),
                    //     ],
                    //   ),
                    // ),
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
                                LengthLimitingTextInputFormatter(10)
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
                            child: Icon(FontAwesomeIcons.pills,
                                color: Colors.blue),
                          ),
                          Expanded(
                              child: Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Drug Allergy",
                                  hintStyle: TextStyle(color: Colors.blueGrey)),
                              controller: _drugallergyController,
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
                              FontAwesomeIcons.clinicMedical,
                              color: Colors.blue,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 20, left: 10),
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              // icon: Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: TextStyle(
                                  color: Colors.black54, fontFamily: 'kanit'),
                              // underline: Container(color: Colors.grey),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: <String>[
                                'Clinic 1',
                                'Clinic 2',
                                'Clinic 3',
                                'Clinic 4',
                                'Clinic 5',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
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
                              } else if (_telController.text.length != 10 &&
                                  !_telController.text.startsWith('0')) {
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
                              } else {
                                _signUpPatientWithFB(
                                    context,
                                    _telController.text,
                                    _drugallergyController.text,
                                    _currentDate.toString(),
                                    dropdownValue);
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

  signupComplete() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PatientMenuScreen(user)));
  }
}
