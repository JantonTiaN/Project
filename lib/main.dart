import 'package:flutter/material.dart';
import 'package:fundee/Screen/welcome_screen.dart';
import 'Screen/constants.dart';
import 'Screen/signin_screen.dart';
import 'Screen/signup_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign Up Screen",
        theme: ThemeData(
            primaryColor: bPrimaryColor,
            scaffoldBackgroundColor: bBackgroundColor,
            textTheme: TextTheme(
                display1: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            button: TextStyle(
              color: bPrimaryColor,
            ),
            headline: TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
            ),
            inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white.withOpacity(.2),
                ))
                ),
            ),
        // home: WelcomeScreen(),
        initialRoute: "Welcome",
        routes: {
          'SignIn':(context) => SignInScreen(),
          'SignUp':(context) => SignUpScreen(),
          'Welcome': (context) => WelcomeScreen(),
        },
        );
  }
}
