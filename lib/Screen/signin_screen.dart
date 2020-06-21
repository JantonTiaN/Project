import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../font_awesome_flutter.dart';
import 'constants.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';


class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // FacebookLogin fbLogin = new FacebookLogin();
  final fbLogin = FacebookLogin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
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
          Expanded(
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
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'SignUp');
                          },
                          child: Text(
                            "SIGN UP",
                            style: Theme.of(context).textTheme.button,
                          ),
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
                          Expanded(
                              child: TextField(
                            decoration:
                                InputDecoration(hintText: "Email Address"),
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
                        Expanded(
                            child: TextFormField(
                          keyboardType: TextInputType.text,
                          // controller: ,

                          decoration: InputDecoration(hintText: "Password"),
                        ))
                      ],
                    ),
                    // Spacer(),
                    // Center(
                    //   child: RichText(
                    //       text: TextSpan(
                    //     text: 'Don\'t have an account?',
                    //     style: TextStyle(color: Colors.black38),
                    //   )),
                    // ),
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
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white.withOpacity(.5),
                                )),
                            child: Icon(FontAwesomeIcons.google,
                                color: Colors.white.withOpacity(.5)),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: bPrimaryColor,
                            ),
                            child: Icon(
                              Icons.arrow_forward,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Future loginWithFacebook(BuildContext context) async {
    FacebookLogin facebookLogin = FacebookLogin();
    FacebookLoginResult result =
        await facebookLogin.logIn(['email', 'public_profile']);
    if (result.status == FacebookLogin.loggedIn) {
      FacebookAccessToken facebookAccessToken = result.accessToken;
      AuthCredential authCredential = FacebookAuthProvider.getCredential(
          accessToken: facebookAccessToken.token);
      FirebaseUser fbUser;
      fbUser =
          (await FirebaseAuth.instance.signInWithCredential(authCredential))
              .user;
    }
  }
}

class FacebookLoginResult {
}

class FacebookLogin {
}
