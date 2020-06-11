import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatefulWidget {
  @override
  _PersonalInfoScreenState createState() => _PersonalInfoScreenState();
}

class _PersonalInfoScreenState extends State<PersonalInfoScreen> {
  final drugallergy = TextEditingController();
  final tel = TextEditingController();
  final gender = TextEditingController();
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
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ', Welcome to Fun-D',
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
        ],
      ),
    );
  }
}


