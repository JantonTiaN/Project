import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fundee/Screen/signin_screen.dart';
import 'package:fundee/widget/stack_container.dart';
import 'package:fundee/Screen/Dentist/dentist_edit_profile.dart';

class DentProfileScreen extends StatefulWidget {
  final FirebaseUser user;
  DentProfileScreen(this.user, {Key key}) : super(key: key);

  @override
  _DentProfileScreenState createState() => _DentProfileScreenState();
}

class _DentProfileScreenState extends State<DentProfileScreen> {
  final FacebookLogin _facebookLogin = FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Column(
          children: <Widget>[
            StackContainer(widget.user),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DentEditProfile(widget.user);
                  },
                ));
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  height: 40,
                  width: 300,
                  decoration: BoxDecoration(
                    // color: bPrimaryColor,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.blueGrey),
                  ),
                  child: Center(
                    child: Text('Edit Profile'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 21),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.help,
                            color: Colors.indigoAccent,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Help & Support',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 21),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.settings,
                            color: Colors.indigoAccent,
                          ),
                          SizedBox(
                            width: 14,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Setting',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {
                  _signOut(context);
                },
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 21),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.indigoAccent,
                            ),
                            SizedBox(
                              width: 14,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Sign Out',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _signOut(BuildContext context) async {
    await _facebookLogin.logOut();
    await _auth.signOut();
    FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
        (route) => false);

    //  await _auth.signOut();
    //  Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => SignInScreen()),
    //     ModalRoute.withName('/'));
  }
}
