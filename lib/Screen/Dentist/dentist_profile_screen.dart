import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fundee/Screen/signin_screen.dart';
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
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            child: Stack(
              children: <Widget>[
                Container(),
                ClipPath(
                  clipper: MyCustomClipper(),
                  child: Container(
                    height: 260,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            colors: [
                          Colors.lightBlue[400],
                          Colors.blue,
                          Colors.indigo[300]
                        ])),
                  ),
                ),
                Align(
                  alignment: Alignment(0, 1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: new SizedBox(
                              width: 120.0,
                              height: 120.0,
                              child: Image.network(
                                widget.user.photoUrl,
                                fit: BoxFit.fill,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(widget.user.displayName,
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold)),
                      // Text(
                      //   widget.user.email,
                      //   widget.user.photoUrl,
                      //   style:
                      //       TextStyle(fontSize: 14, color: Colors.grey[700]),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
          GestureDetector(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) {
              //     return DentailHistorkeytool -list -vyCard();
              //   },
              // ));
            },
            child: Padding(
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

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
