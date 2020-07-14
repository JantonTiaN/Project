import 'package:flutter/material.dart';

class FbSignupScreen extends StatefulWidget {
  @override
  _FbSignupScreenState createState() => _FbSignupScreenState();
}

class _FbSignupScreenState extends State<FbSignupScreen> {
  @override
  Widget build(BuildContext context) {
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
                          fontSize: 16,
                        ),
                      )),
                    ),
                  ],
                )));
  }
}
