import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundee/States/current_user.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../font_awesome_flutter.dart';
import '../../constants.dart';
import '../../signin_screen.dart';
import '../patient_menu_screen.dart';

class PatientSignUpScreen extends StatefulWidget {
  @override
  _PatientSignUpScreenState createState() => _PatientSignUpScreenState();
}

class _PatientSignUpScreenState extends State<PatientSignUpScreen> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmpasswordController = TextEditingController();
  DateTime _currentDate = new DateTime.now();
  TextEditingController _drugallergyController = TextEditingController();
  TextEditingController _telController = TextEditingController();
  String dropdownValue = 'คลินิก 1';

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

  void _signUpPatient(String email, String password, String fullName,
      String tel, String drugallergy, String brithDate) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString = await _currentUser.signUpPatients(
          email, password, fullName, tel, drugallergy, brithDate);
      if (_returnString == 'success') {
        showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
                  content: Text('Registration complete'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('OK'),
                      onPressed: signupComplete(),
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
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        AssetImage("assets/images/patient-signup-screen2.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Text(
                        'Create New Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ],
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
                        decoration: InputDecoration(hintText: "Full Name"),
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
                        decoration:
                            InputDecoration(hintText: "Confirm Password"),
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
                          LengthLimitingTextInputFormatter(10)
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
                        FontAwesomeIcons.pills,
                        color: bPrimaryColor,
                      ),
                    ),
                    Expanded(
                        child: Container(
                      margin: EdgeInsets.only(right: 20, left: 10),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "Drug Allergy"),
                        controller: _drugallergyController,
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
                  "คลินิกที่เข้ารักษา",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'kanit',
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
                        FontAwesomeIcons.clinicMedical,
                        color: bPrimaryColor,
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
                          'คลินิก 1',
                          'คลินิก 2',
                          'คลินิก 3',
                          'คลินิก 4',
                          'คลินิก 5',
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
                        if (_fullNameController.text.isEmpty ||
                            _emailController.text.isEmpty ||
                            _passwordController.text.isEmpty ||
                            _confirmpasswordController.text.isEmpty ||
                            _telController.text.isEmpty ||
                            _drugallergyController.text.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Text(
                                'Please fill out all information.',
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
                          _signUpPatient(
                              _emailController.text,
                              _passwordController.text,
                              _fullNameController.text,
                              _telController.text,
                              _drugallergyController.text,
                              _currentDate.toString());
                        } else if (_telController.text.length != 10 &&
                            !_telController.text.startsWith('0')) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Text(
                                'Please make sure your Phone Number is correct',
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  child: Text('OK'),
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                )
                              ],
                            ),
                          );
                        } else {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Text(
                                'Passwords do not match.',
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 26, vertical: 16),
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

  signupComplete() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    await user.reload();
    user = await auth.currentUser();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PatientMenuScreen(user)));
  }
}
