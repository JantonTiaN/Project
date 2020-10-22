import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fundee/Screen/Dentist/dentist_appointment_screen.dart';
import 'package:fundee/Screen/Dentist/dentist_home_screen.dart';
import 'package:fundee/Screen/Dentist/dentist_profile_screen.dart';
import 'package:fundee/Screen/Patient/patient_history_screen.dart';
import 'package:fundee/Screen/Patient/patient_home_screen.dart';
import 'package:fundee/Screen/Patient/patient_profile_screen.dart';
import 'package:fundee/Screen/Patient/patient_sug_screen.dart';
import 'package:fundee/Screen/signin_screen.dart';
// import 'package:fundee/user.dart';
import 'package:google_sign_in/google_sign_in.dart';

class PatientMenuScreen extends StatefulWidget {
  final FirebaseUser user;
  PatientMenuScreen(this.user, {Key key}) : super(key: key);

  @override
  _PatientMenuScreenState createState() => _PatientMenuScreenState();
}

String patientClinic;
getClinic() async {
  Firestore firestore = Firestore.instance;
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  return await firestore
      .collection('FunD')
      .document('funD')
      .collection('AllUsers')
      .document('allUsers')
      .collection('Patients')
      .document(user.uid)
      .get()
      .then((value) {
    patientClinic = value.data['clinic'];
  });
}

class _PatientMenuScreenState extends State<PatientMenuScreen> {
  final FacebookLogin _facebookLogin = FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  int _selectPage = 0;

  @override
  void initState() {
    super.initState();
    getClinic();
  }

  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
      PatientHomeScreen(widget.user),
      PatientHistoryScreen(widget.user),
      PatientSuggestion(widget.user),
      PatientProfileScreen(widget.user),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
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
                Icons.history,
                color: Colors.black,
                size: 23,
              ),
              activeIcon: Icon(
                Icons.history,
                color: Colors.blue[300],
                size: 23,
              ),
              title: Text(
                'History',
              )),
          BubbleBottomBarItem(
              backgroundColor: Colors.blue[300],
              icon: Icon(
                Icons.library_books,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.library_books,
                color: Colors.blue[300],
              ),
              title: Text("Suggestion")),
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

    //  await _auth.signOut();
    //  Navigator.pushAndRemoveUntil(
    //     context,
    //     MaterialPageRoute(builder: (context) => SignInScreen()),
    //     ModalRoute.withName('/'));
  }
}
