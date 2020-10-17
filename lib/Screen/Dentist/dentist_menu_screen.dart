import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fundee/Screen/Dentist/dentist_appointment_screen.dart';
import 'package:fundee/Screen/Dentist/dentist_home_screen.dart';
import 'package:fundee/Screen/Dentist/dentist_profile_screen.dart';
import 'package:fundee/Screen/signin_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'patientList.dart';

class DentMenuScreen extends StatefulWidget {
  final FirebaseUser user;
  DentMenuScreen(this.user, {Key key}) : super(key: key);

  @override
  _DentMenuScreenState createState() => _DentMenuScreenState();
}

class _DentMenuScreenState extends State<DentMenuScreen> {
  bool isLoggedIn = false;
  String email = '';
  final FacebookLogin _facebookLogin = FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    // autoLogIn();    
  }

  int _selectPage = 0;

  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
      DentHomeScreen(widget.user),
      DentAppointmentScreen(),
      PatientList(widget.user),
      DentProfileScreen(widget.user),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "Home",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   backgroundColor: Colors.blue[300],
      // ),
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
                        Text("     "),
                        Text("Hi, " + widget.user.uid)
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
          ],
        ),
      ),

      // //WE NOT GONNA USE THIS BUTTON ANY MORE !!!!!!!!!! BUT NOT DELETE YET
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context, MaterialPageRoute(builder: (context) => PatientList()));
      //   },
      //   child: Icon(FontAwesomeIcons.tooth),
      //   backgroundColor: Colors.blue[300],
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: _pageOptions[_selectPage],
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: _selectPage,
        onTap: (int index) {
          setState(() {
            _selectPage = index;
          });
        },
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        // fabLocation: BubbleBottomBarFabLocation.end,
        hasNotch: true,
        hasInk: true,
        inkColor: Colors.black12,
        items: <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.blue[300],
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue[300],
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.blue[300],
              icon: Icon(
                Icons.calendar_today,
                color: Colors.black,
                size: 20,
              ),
              activeIcon: Icon(
                Icons.calendar_today,
                color: Colors.blue[300],
                size: 20,
              ),
              title: Text(
                "Appointment",
                style: TextStyle(fontSize: 13),
              )),
          BubbleBottomBarItem(
              backgroundColor: Colors.blue[300],
              icon: Icon(
                Icons.recent_actors,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.recent_actors,
                color: Colors.blue[300],
              ),
              title: Text("Patient")),
          BubbleBottomBarItem(
              backgroundColor: Colors.blue[300],
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.person,
                color: Colors.blue[300],
              ),
              title: Text("Profile")),
        ],
      ),
      // body: Container(
      //   child: Column(
      //     children: <Widget>[
      //       FlatButton(
      //           child: record(),
      //           onPressed: () => Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => DentalRecord()))),
      //       Text("Dental Record"),
      //       FlatButton(
      //           child: patient(),
      //           onPressed: () => Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => PatientList()))),
      //       Text("Patient List"),
      //     ],
      //   ),
      // ),
    );
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
    FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
        (route) => false);
  }

  // void autoLogIn() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String userEmail = prefs.getString('email');

  //   if (userEmail != null) {
  //     setState(() {
  //       isLoggedIn = true;
  //       email = userEmail;
  //     });
  //     return;
  //   }
  // }
}
