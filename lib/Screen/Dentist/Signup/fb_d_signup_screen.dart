import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';
import 'package:fundee/Screen/constants.dart';
import 'package:fundee/States/current_user.dart';
import 'package:fundee/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FbDSignupScreen extends StatefulWidget {
  // final FirebaseUser user;
  // FbDSignupScreen(this.user, {Key key}) : super(key: key);

  @override
  _FbDSignupScreenState createState() => _FbDSignupScreenState();
}

class _FbDSignupScreenState extends State<FbDSignupScreen> {
  DateTime _currentDate = new DateTime.now();
  TextEditingController _telController = TextEditingController();
  TextEditingController _citizenidController = TextEditingController();
  TextEditingController _permissionController = TextEditingController();
  String dropdownValue = 'Clinic 1';
  @override
  void initState() {
    super.initState();
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

  void _signUpDentistWithFB(BuildContext context, String tel, String citizenID,
      String permission, String birthDate, String clinic) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString = await _currentUser.signUpDentistsWithFBAndGG(
          tel, citizenID, permission, birthDate, clinic);
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
                              inputFormatters: <TextInputFormatter>[
                                WhitelistingTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(13)
                              ],
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
                                  hintText: "Permission Number",
                                  hintStyle: TextStyle(color: Colors.blueGrey)),
                              keyboardType: TextInputType.number,
                              controller: _permissionController,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(5)
                              ],
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
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Clinic",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'kanit',
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
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
                                  _citizenidController.text.isEmpty ||
                                  _permissionController.text.isEmpty) {
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
                              } else if (_citizenidController.text.length !=
                                  13) {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
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
                              } else if (_permissionController.text.length >
                                  5) {
                                showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: const Text('Error'),
                                          content: Text(
                                            'Invalid Permission',
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                              child: Text('OK'),
                                              onPressed: () =>
                                                  Navigator.pop(context, 'OK'),
                                            )
                                          ],
                                        ));
                              } else {
                                _signUpDentistWithFB(
                                    context,
                                    _telController.text,
                                    _citizenidController.text,
                                    _permissionController.text,
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => DentMenuScreen(user)));
  }
}
