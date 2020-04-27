import 'package:flutter/material.dart';
import 'package:fundee/detail.dart';

class DentalRecord extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dental Charting')),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                width: 400,
                height: 400,
                child: Image.asset('images/tooth/AllGum.png'),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(86.5, 142.5, 0, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/1-lastest.png'),
                    onPressed: () {
                      // tooth1Detail();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth1Detail(context)));
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(85, 115, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/2-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth2Detail(context)));
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(90, 88, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/3-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth3Detail(context)));
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(97.5, 65, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/4-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 44,
                width: 44,
                margin: EdgeInsets.fromLTRB(111, 44, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/5-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.fromLTRB(127, 31, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/6-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 44,
                width: 44,
                margin: EdgeInsets.fromLTRB(139, 13, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/7-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 46,
                width: 46,
                margin: EdgeInsets.fromLTRB(162, 6, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/8-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 45,
                width: 45,
                margin: EdgeInsets.fromLTRB(190, 7, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/9-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 44,
                width: 44,
                margin: EdgeInsets.fromLTRB(213, 14, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/10-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.fromLTRB(229, 32, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/11-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 45,
                width: 45,
                margin: EdgeInsets.fromLTRB(238, 47, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/12-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 46,
                width: 46,
                margin: EdgeInsets.fromLTRB(249, 69, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/13-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 46,
                width: 46,
                margin: EdgeInsets.fromLTRB(256, 91, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/14-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(260, 115, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/15-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(260, 142.5, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/16-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(264, 220, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/17-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(264, 250, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/18-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 47,
                width: 47,
                margin: EdgeInsets.fromLTRB(259, 278, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/19-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(249, 305, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/20-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 43,
                width: 43,
                margin: EdgeInsets.fromLTRB(237, 330, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/21-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 38,
                width: 38,
                margin: EdgeInsets.fromLTRB(225, 346, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/22-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 36.5,
                width: 36.5,
                margin: EdgeInsets.fromLTRB(212, 357, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/23-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 36,
                width: 36,
                margin: EdgeInsets.fromLTRB(193, 361, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/24-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 36,
                width: 36,
                margin: EdgeInsets.fromLTRB(173.5, 361.5, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/25-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 36.5,
                width: 36.5,
                margin: EdgeInsets.fromLTRB(154, 358, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/26-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 36,
                width: 36,
                margin: EdgeInsets.fromLTRB(140, 349, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/27-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                height: 44,
                width: 44,
                margin: EdgeInsets.fromLTRB(122, 329.5, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/28-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(104, 302, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/29-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(93, 275, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/30-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(87, 247.5, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/31-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(88, 217, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/32-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
            ],
          ),
        ));
  }
}
