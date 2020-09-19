import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fundee/Screen/Dentist/dentist_appointment_screen.dart';
import 'package:fundee/Screen/Dentist/dentist_home_screen.dart';
import 'package:fundee/Screen/Dentist/dentist_profile_screen.dart';
import 'package:fundee/Screen/signin_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'patientList.dart';
import 'package:fundee/Screen/Dentist/dentist_edit_profile.dart';

class DentMenuScreen extends StatefulWidget {
  final FirebaseUser user;
  DentMenuScreen(this.user, {Key key}) : super(key: key);

  @override
  _DentMenuScreenState createState() => _DentMenuScreenState();
}

class _DentMenuScreenState extends State<DentMenuScreen> {
  final FacebookLogin _facebookLogin = FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final PageStorageBucket bucket = PageStorageBucket();
  int _selectPage = 0;
  final List<Widget> _pageOptions = [
    DentHomeScreen(),
    DentAppointmentScreen(),
    PatientList(),
    DentProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
}
