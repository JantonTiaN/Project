import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';
import 'package:fundee/Screen/Patient/patient_menu_screen.dart';
import 'package:fundee/Screen/SignupProcess/gg_select_role.dart';
import 'package:fundee/States/current_user.dart';
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
  final FacebookLogin _facebookLogin = FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // autologin();
  }

  @override
  Widget build(BuildContext context) {
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
                            PopupMenuButton(
                              child: Text("SIGN UP",
                                  style: TextStyle(
                                      color: bPrimaryColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600)),
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
                                  onTap: () => loginWithFacebook(context)),
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
                                  signIn();
                                  // isLoggedIn ? logout() : signIn();
                                },
                              )
                            ],
                          ),
                        )
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
      checkRole();
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
      checkRole();
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
        checkRole();
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

  checkRole() async {
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    bool docExist = await checkIfDocExists(user.uid);
    print('Doccccccccccc');
    print(docExist);
    if (docExist == true) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => DentMenuScreen(user)));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => PatientMenuScreen(user)));
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
      print('Not Nullllllllllllllllllllllllll');
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
  // Future _signOut(BuildContext context) async {
  //   await _facebookLogin.logOut();
  //   await _auth.signOut();
  //   FirebaseAuth.instance.signOut();
  //   await _googleSignIn.signOut();
  //   Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => SignInScreen()),
  //       (route) => false);
  // }

}
