import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fundee/Screen/signin_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Screen/Dentist/DentRecord/dentalRecord.dart';
import 'patientList.dart';

class HomeScreen extends StatefulWidget {
  final FirebaseUser user;
  HomeScreen(this.user, {Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FacebookLogin _facebookLogin = FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue[50]),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Text(
                          "Welcome to Fun-D",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          //signEmail(),
                          // Image.network(
                          //   widget.user.photoUrl,
                          //   height: 50,
                          //   width: 50,
                          // ),
                          // Text("     "),
                          // Text("Hi, " + widget.user.displayName)
                        ],
                      )
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text("Notifications"),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Setting"),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Sign Out"),
                onTap: () {
                  _signOut(context);
                  // CurrentUser _currentUser =
                  //     Provider.of<CurrentUser>(context, listen: false);
                  // String _returnString = await _currentUser.signOut();
                  // if (_returnString == 'success') {
                  //   Navigator.pushAndRemoveUntil(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => OurRoot(),
                  //       ),
                  //       (route) => false);
                  // }
                },
              ),
              // ListTile(
              //   title: Text("Etc"),
              //   onTap: (){
              //     Navigator.pop(context);
              //   },
              // )
            ],
          ),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              FlatButton(
                  child: record(),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DentalRecord()))),
              Text("Dental Record"),
              FlatButton(
                  child: patient(),
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PatientList()))),
              Text("Patient List"),
            ],
          ),

          // bottomNavigationBar: CurvedNavigationBar(

          //   items: <Widget>[
          //     Icon(Icons.home, size: 20, color: Colors.black),
          //     Icon(Icons.calendar_today, size: 20, color: Colors.black),
          //     Icon(Icons.add, size: 20, color: Colors.black),
          //     Icon(Icons.list, size: 20, color: Colors.black),
          //     Icon(Icons.account_circle, size: 20, color: Colors.black),
          //   ],
          //   animationDuration: Duration(milliseconds: 200),
          //   animationCurve: Curves.bounceInOut,
          //   onTap: (index) {
          //     debugPrint("Current Index is $index");
          //   },
          // ),
        ));
  }

  Widget record() {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Image.asset("assets/images/ToothLogo.png"),
    );
  }

  Widget patient() {
    return Container(
      width: 150.0,
      height: 150.0,
      child: Image.asset("assets/images/patient.png"),
    );
  }

  signEmail() {
    if (Image.network(widget.user.photoUrl) == null) {
      return Image.asset(
        "assets/images/Dentalcaries.png",
        height: 50,
        width: 50,
      );
    }
  }

  Future _signOut(BuildContext context) async {
    await _facebookLogin.logOut();
    await _auth.signOut();
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
