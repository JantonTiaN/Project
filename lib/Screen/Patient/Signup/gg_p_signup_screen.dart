import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundee/Screen/constants.dart';
import 'package:fundee/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class GgPSignupScreen extends StatefulWidget {
  // final FirebaseUser user;
  // GgPSignupScreen(this.user, {Key key}) : super(key: key);
  @override
  _GgPSignupScreenState createState() => _GgPSignupScreenState();
}

class _GgPSignupScreenState extends State<GgPSignupScreen> {
  DateTime _currentDate = new DateTime.now();
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _drugallergyController = TextEditingController();
  TextEditingController _telController = TextEditingController();

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
                          image:
                              AssetImage("assets/images/Logo/Google-icon.png"),
                        )),
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                          child: Text(
                        "Google Sign Up",
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
