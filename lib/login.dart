import 'package:flutter/material.dart';
import 'package:fundee/Animation/FadeAnimation.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Column(
          children: <Widget>[
             Container(
                height: 360,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('assets/images/login-background.png'))),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: FadeAnimation(1,Container(
                          margin: EdgeInsets.only(top: 40),
                          child: Center(
                            child: Text("ล็อคอิน",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontFamily: 'Kanit')),
                          )
                      )),
                ),
                  ],
                )
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Column(
                children: <Widget>[
                  FadeAnimation(1.1,Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(120, 180, 255, .2),
                                blurRadius: 20.0,
                                offset: Offset(0, 10))
                          ]),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[200]))),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "อีเมล",
                                  hintStyle: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 15,
                                      fontFamily: 'Kanit')),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(5.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "รหัสผ่าน",
                                hintStyle: TextStyle(
                                    color: Colors.grey[400],
                                    fontSize: 15,
                                    fontFamily: 'Kanit'),
                              ),
                            ),
                          )
                        ],
                      )
                      )
                      ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(1.2,Text(
                    "ลืมรหัสผ่าน?",
                    style: TextStyle(color: Colors.grey, fontFamily: 'Kanit'),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(1.3,Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(120, 180, 255, 1),
                            Color.fromRGBO(120, 180, 255, .6),
                          ])),
                      child: RaisedButton(
                        onPressed: (){},
                      child: Center(
                        
                          child: Text(
                        "เข้าสู่ระบบ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Kanit'),
                      )
                      ))
                  )),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.blue[300]),
                              child: Center(
                          child: Text(
                        "Facebook",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Kanit'),
                      ))
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey[400]),
                            child: Center(
                            child: Text(
                              "Google",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontFamily: 'Kanit'),
                            ))),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
