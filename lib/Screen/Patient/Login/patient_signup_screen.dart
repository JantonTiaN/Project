import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundee/Screen/Patient/Login/patient_personalinfo_screen.dart';
import '../../constants.dart';

class PatientSignUpScreen extends StatefulWidget {
  @override
  _PatientSignUpScreenState createState() => _PatientSignUpScreenState();
}

class _PatientSignUpScreenState extends State<PatientSignUpScreen> {
  final fname = TextEditingController();
  final lname = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/ToothbrushFixed.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Positioned(
              child: Stack(
                children: <Widget>[
                  Positioned(
                      bottom: -10,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Create New Account',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.person,
                    color: bPrimaryColor,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Firstname"),
                    controller: fname,
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Lastname"),
                    controller: lname,
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(
                    Icons.mail,
                    color: bPrimaryColor,
                  ),
                ),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Email Adcress"),
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
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
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Password"),
                    controller: password,
                    obscureText: true,
                  ),
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Confirm Password"),
                    controller: confirmpassword,
                    obscureText: true,
                  ),
                )),
              ],
            ),
          ),
          Column(
            children: <Widget>[
              FittedBox(
                child: GestureDetector(
                  onTap: () {
                    // firestoreInstance.collection("patients").add({
                    //   "firstName": fname,
                    //   "lastName": lname,
                    //   "email": email,
                    // }).then((value) {
                    //   print(value.documentID);
                    // });
                    // addPatient(context, {'fisrtName': fname.text}, documentName);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return PatientPersonalInfoScreen();
                      },
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: bPrimaryColor,
                    ),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "NEXT",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              .copyWith(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  // void createUser() async => await databaseReference.collection('patients').document('1').setData({
  //     'firstName': fname,
  //     'lastName': lname,
  //     'eMail': email,
  //     'password': password
  //   });
}
