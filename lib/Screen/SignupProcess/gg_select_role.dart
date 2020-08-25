import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/Signup/gg_d_signup_screen.dart';
import 'package:fundee/Screen/Patient/Signup/gg_p_signup_screen.dart';
import 'package:fundee/Screen/constants.dart';

class GgSelectRole extends StatefulWidget {
  // final FirebaseUser user;
  // FbPSignupScreen(this.user, {Key key}) : super(key: key);
  @override
  _GgSelectRoleState createState() => _GgSelectRoleState();
}

class _GgSelectRoleState extends State<GgSelectRole> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bBackgroundColor,
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
                                  return GgDSignupScreen();
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
                                return GgPSignupScreen();
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
