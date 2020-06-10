import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BackButtonWidget(),
        ],
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    top: 20,
                    child: Row(
                      children: <Widget>[
                        IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'SignIn');
                          },
                          child: Text(
                            'Back',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: -10,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
          );
  }
}
