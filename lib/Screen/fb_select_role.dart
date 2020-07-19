import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/Signup/fb_d_signup_screen.dart';
import 'package:fundee/Screen/Patient/Signup/fb_p_signup_screen.dart';

class FbSelectRole extends StatefulWidget {
  final FirebaseUser user;
  FbSelectRole(this.user, {Key key}) : super(key: key);
  @override
  _FbSelectRoleState createState() => _FbSelectRoleState();
}

class _FbSelectRoleState extends State<FbSelectRole> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Builder(
            builder: (context) => Center(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 220),
                        child: Text(
                          "Welcome to Fun-D",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Who are you ?",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: FittedBox(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  //return FbDSignupScreen();
                                },
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 30),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 26, vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.blue[400],
                              ),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "DENTIST",
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
                      ),
                      FittedBox(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return FbPSignupScreen();
                              },
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 60),
                            padding: EdgeInsets.symmetric(
                                horizontal: 26, vertical: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.blue[400],
                            ),
                            child: Row(
                              children: <Widget>[
                                Text(
                                  "PATIENT",
                                  style: Theme.of(context)
                                      .textTheme
                                      .button
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )));
  }
}
