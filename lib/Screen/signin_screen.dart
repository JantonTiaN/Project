import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';
import 'package:fundee/Screen/Patient/patient_home_screen.dart';
import 'package:fundee/Screen/Patient/patient_menu_screen.dart';
import 'package:fundee/Screen/SignupProcess/gg_select_role.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Dentist/dentist_home_screen.dart';
import 'SignupProcess/fb_select_role.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fundee/Screen/SignupProcess/fb_select_role.dart';

enum LoginType { email, google }

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isLoggedIn = false;
  String email = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  // final FacebookLogin _facebookLogin = FacebookLogin();
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // bool _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _signingIn() {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            color: Colors.black.withOpacity(0.5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SpinKitFadingFour(
                  color: Colors.blue[300],
                  size: 50,
                ),
                Text(
                  "Signing in...",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontFamily: 'kanit',
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                )
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: bBackgroundColor,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 650),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/ToothbrushFixed.jpg"),
                      fit: BoxFit.cover,
                      // alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Flexible(
                  fit: FlexFit.loose,
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "SIGN IN",
                              style: Theme.of(context).textTheme.display1,
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Icon(
                                  Icons.email,
                                  color: bPrimaryColor,
                                ),
                              ),
                              Flexible(
                                  fit: FlexFit.loose,
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: "Email Address"),
                                    keyboardType: TextInputType.emailAddress,
                                    controller: _emailController,
                                  ))
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: Icon(
                                Icons.lock,
                                color: bPrimaryColor,
                              ),
                            ),
                            Flexible(
                                fit: FlexFit.loose,
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  // controller: ,
                                  decoration:
                                      InputDecoration(hintText: "Password"),
                                  obscureText: true,
                                  controller: _passwordController,
                                ))
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.white.withOpacity(.5),
                                        )),
                                    child: Icon(FontAwesomeIcons.facebookF,
                                        color: Colors.white.withOpacity(.5)),
                                  ),
                                  onTap: () {
                                    loginWithFacebook(context);
                                  }),
                              SizedBox(width: 20),
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white.withOpacity(.5),
                                      )),
                                  child: Icon(FontAwesomeIcons.google,
                                      color: Colors.white.withOpacity(.5)),
                                ),
                                onTap: () {
                                  loginWithGoogle(context);
                                  _signingIn();
                                },
                              ),
                              Spacer(),
                              InkWell(
                                child: Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: bPrimaryColor,
                                  ),
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.black,
                                  ),
                                ),
                                onTap: () {
                                  _signingIn();
                                  signIn();
                                  // isLoggedIn ? logout() : signIn();
                                },
                              ),
                            ],
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have any account?'),
                              PopupMenuButton(
                                child: Text(" Sign Up",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    )),
                                onSelected: (result) {
                                  if (result == 0) {
                                    Navigator.pushNamed(context, 'DSignUp');
                                  }
                                  if (result == 1) {
                                    Navigator.pushNamed(context, 'PSignUp');
                                  }
                                },
                                itemBuilder: (context) => [
                                  PopupMenuItem(
                                    child: Row(
                                      children: <Widget>[
                                        // Icon(Icons.local_hospital),
                                        SizedBox(width: 10.0),
                                        Text("Dentist",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                    value: 0,
                                  ),
                                  PopupMenuItem(
                                    child: Row(
                                      children: <Widget>[
                                        // Icon(Icons.person),
                                        SizedBox(width: 10.0),
                                        Text("Patient",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                    value: 1,
                                  ),
                                ],
                              ),
                            ])
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  //Email SignIn
  Future<FirebaseUser> signIn() async {
    bool isLoggedIn = false;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      prefs.setString('email', _emailController.text);
      setState(() {
        email = _emailController.text;
        isLoggedIn = true;
        print(isLoggedIn);
      });
      _emailController.clear();
      checkRole(context);
    } catch (error) {
      print(error.message);
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(error.message, style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.red,
      ));
    }
  }

  //Google SignIn
  Future loginWithGoogle(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
      'https://www.googleapis.com/auth/cloud-platform.read-only',
    ]);

    GoogleSignInAccount user = await _googleSignIn.signIn();
    GoogleSignInAuthentication userAuth = await user.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: null, accessToken: userAuth.accessToken);
    AuthResult authResult = await _auth.signInWithCredential(credential);
    if (authResult.additionalUserInfo.isNewUser) {
      selectRoleGoogle(context);
    } else {
      checkRole(context);
    }
  }

  //Facebook SignIn
  Future loginWithFacebook(BuildContext context) async {
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult result =
        await facebookLogin.logIn(['email', 'public_profile']);

    if (result.status == FacebookLoginStatus.loggedIn) {
      FacebookAccessToken token = result.accessToken;
      AuthCredential credential =
          FacebookAuthProvider.getCredential(accessToken: token.token);
      print("Access Token = $token");
      AuthResult authResult = await _auth.signInWithCredential(credential);
      if (authResult.additionalUserInfo.isNewUser) {
        selectRoleFacebook(context);
      } else {
        checkRole(context);
      }
      var user = await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  Future checkAuth(BuildContext context) async {
    FirebaseUser user = await _auth.currentUser();
    if (user = null) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => DentHomeScreen(user)));
    }
  }

  Future selectRoleFacebook(BuildContext context) async {
    FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => FbSelectRole(user)));
    }
  }

  Future selectRoleGoogle(BuildContext context) async {
    FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => GgSelectRole(user)));
    }
  }

  checkRole(BuildContext context) async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    bool docExist = await checkIfDocExists(user.uid);
    print('-----DENTIST-----');
    print(docExist);
    if (docExist == true) {
      helloDentist(context);
    } else {
      helloPatient(context);
    }
  }

  Future<bool> checkIfDocExists(String docId) async {
    // Get reference to Firestore collection
    var collectionDent = Firestore.instance
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Dentists');

    var doc = await collectionDent.document(docId).get();
    return doc.exists;
  }

  void autologin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String userEmail = prefs.getString('email');
    if (userEmail != null) {
      print('-----Not Null------');
      setState(() {
        isLoggedIn = true;
        email = userEmail;
      });
      return;
    }
  }

  Future<Null> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('email', null);
    setState(() {
      email = '';
      isLoggedIn = false;
    });
  }
}

String patientClinic;
String patientUid;
getPatientClinic() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  Firestore.instance
      .collection('FunD')
      .document('funD')
      .collection('AllUsers')
      .document('allUsers')
      .collection('Patients')
      .document(user.uid)
      .get()
      .then((value) => {
            if (value.data['clinic'] != null)
              {
                patientClinic = value.data['clinic'],
                patientUid = value.data['uid']
              }
          });
}

helloPatient(BuildContext context) async {
  getPatientClinic();
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  String name = user.displayName;
  String greetingmeg = greeting();
  showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            content: Text('$greetingmeg, $name !'),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PatientMenuScreen(user)));
                },
              )
            ],
          ));
}

helloDentist(BuildContext context) async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  Firestore firestore = Firestore.instance;
  String message;
  String name = user.displayName;
  String greetingmeg = greeting();

  DocumentReference documentReference = firestore
      .collection('FunD')
      .document('funD')
      .collection('AllUsers')
      .document('allUsers')
      .collection('Dentists')
      .document(user.uid);
  documentReference.get().then((value) => {
        if (value.data['workingTime'] != null)
          {
            message = '$greetingmeg, $name !',
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      content: Text(message),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DentMenuScreen(user)));
                          },
                        )
                      ],
                    ))
          }
        else
          {
            message =
                'Welcome $name , Plaese fill in your Timetable at Edit Profile ',
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                      content: Text(message),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DentMenuScreen(user)));
                          },
                        )
                      ],
                    ))
          }
      });
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Good Morning';
  }
  if (hour < 17) {
    return 'Good Afternoon';
  }
  return 'Good Evening';
}
