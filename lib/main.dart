import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentalRecord.dart';
import 'package:fundee/Screen/Dentist/Signup/dentist_signup_screen.dart';
import 'package:fundee/Screen/Dentist/Signup/fb_d_signup_screen.dart';
import 'package:fundee/Screen/Patient/Signup/fb_p_signup_screen.dart';
import 'package:fundee/Screen/Patient/Signup/gg_p_signup_screen.dart';
import 'package:fundee/Screen/welcome_screen.dart';
import 'package:fundee/States/current_user.dart';
import 'package:provider/provider.dart';
import 'Screen/Dentist/Signup/gg_d_signup_screen.dart';
import 'Screen/Patient/Signup/patient_signup_screen.dart';
import 'Screen/constants.dart';
import 'Screen/signin_screen.dart';
import 'States/root.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        title: "Fun-D",
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
            headline:
                TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
          ),
          inputDecorationTheme: InputDecorationTheme(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
            color: Colors.white.withOpacity(.2),
          ))),
        ),
        // home: GgDSignupScreen(),
        initialRoute: "OurRoot",
        routes: {
          'SignIn': (context) => SignInScreen(),
          'PSignUp': (context) => PatientSignUpScreen(),
          'Welcome': (context) => WelcomeScreen(),
          'OurRoot': (context) => OurRoot(),
          'DSignUp': (context) => DentistSignUpScreen(),
          'DRecord': (context) => DentalRecord(),
          'GGPSignUp': (context) => GgPSignupScreen(),
          'FBPSignUp': (context) => FbPSignupScreen(),
        },
      ),
    );
  }
}
