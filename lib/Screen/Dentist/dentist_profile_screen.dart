import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fundee/Screen/signin_screen.dart';
import 'package:fundee/profile_page.dart';

class DentProfileScreen extends StatefulWidget {
  // final FirebaseUser user;
  // DentProfileScreen(this.user, {Key key}) : super(key: key);

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
        body: Center(
            child: Column(
      children: [
        FittedBox(
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Container(
              // margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.blueGrey)),
              child: Row(
                children: <Widget>[
                  Text(
                    "PROFILE",
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
        FittedBox(
          child: GestureDetector(
            onTap: () {
              _signOut(context);
            },
            child: Container(
              // margin: EdgeInsets.only(bottom: 20),
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.blueGrey)),
              child: Row(
                children: <Widget>[
                  Text(
                    "SIGN OUT",
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
    )));
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
