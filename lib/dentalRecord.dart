import 'package:flutter/material.dart';
import 'package:fundee/detail.dart';

class DentalRecord extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dental Charting')),
        body: Center(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40),
                child: Center(
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Upper'),
                          Text('Lower')
                        ],
                      ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Right'),
                          Text('Left')
                        ],
                      ),
                    ),
                  ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(65, 260, 65, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('1'),
                    Text('16')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(67, 227, 70, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('2'),
                    Text('15')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(75, 190, 75, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('3'),
                    Text('14')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(85, 160, 85, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('4'),
                    Text('13')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(102, 130, 102, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('5'),
                    Text('12')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(122, 104, 122, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('6'),
                    Text('11')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(143, 86, 150, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('7'),
                    Text('10')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(177, 74, 194, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('8'),
                    Text('9')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(60, 340, 65, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('32'),
                    Text('17')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(62, 375, 67, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('31'),
                    Text('18')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(67, 410, 72, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('30'),
                    Text('19')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(79, 447, 81, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('29'),
                    Text('20')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(100, 485, 102, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('28'),
                    Text('21')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(128, 505, 135, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('27'),
                    Text('22')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(155, 515, 163, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('26'),
                    Text('23')
                  ],
                )
              ),
              Container(
                margin: EdgeInsets.fromLTRB(180, 520, 190, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('25'),
                    Text('24')
                  ],
                )
              ),
              Center(
                child: Container(
                  width: 430,
                  height: 430,
                  child: Image.asset('images/tooth/AllGum.png'),
                ),
              ),
              Container(
                width: 54,
                height: 54,
                margin: EdgeInsets.fromLTRB(86.5, 240, 0, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/1-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth1Detail(context)));
                    }),
              ),
              Container(
                width: 52,
                height: 52,
                margin: EdgeInsets.fromLTRB(85, 210, 00, 0),
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
                width: 52,
                height: 52,
                margin: EdgeInsets.fromLTRB(90, 180, 00, 0),
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
                width: 50,
                height: 50,
                margin: EdgeInsets.fromLTRB(100, 157, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/4-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth4Detail(context)));
                    }),
              ),
              Container(
                width: 48,
                height: 48,
                margin: EdgeInsets.fromLTRB(113, 134, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/5-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth5Detail(context)));
                    }),
              ),
              Container(
                height: 42,
                width: 42,
                margin: EdgeInsets.fromLTRB(130, 118, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/6-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth6Detail(context)));
                    }),
              ),
              Container(
                height: 42,
                width: 42,
                margin: EdgeInsets.fromLTRB(142, 101, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/7-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth7Detail(context)));
                    }),
              ),
              Container(
                height: 42,
                width: 42,
                margin: EdgeInsets.fromLTRB(164, 95, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/8-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth8Detail(context)));
                    }),
              ),
              Container(
                height: 42,
                width: 42,
                margin: EdgeInsets.fromLTRB(189, 94, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/9-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth9Detail(context)));
                    }),
              ),
              Container(
                height: 42,
                width: 42,
                margin: EdgeInsets.fromLTRB(211, 99, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/10-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth10Detail(context)));
                    }),
              ),
              Container(
                height: 42,
                width: 42,
                margin: EdgeInsets.fromLTRB(226, 115, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/11-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth11Detail(context)));
                    }),
              ),
              Container(
                height: 47,
                width: 47,
                margin: EdgeInsets.fromLTRB(238, 130, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/12-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth12Detail(context)));
                    }),
              ),
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.fromLTRB(251, 151, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/13-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth13Detail(context)));
                    }),
              ),
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.fromLTRB(260, 176, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/14-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth14Detail(context)));
                    }),
              ),
              Container(
                width: 53,
                height: 53,
                margin: EdgeInsets.fromLTRB(265, 203, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/15-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth15Detail(context)));
                    }),
              ),
              Container(
                width: 57,
                height: 57,
                margin: EdgeInsets.fromLTRB(264, 234, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/16-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth16Detail(context)));
                    }),
              ),
              Container(
                width: 55,
                height: 55,
                margin: EdgeInsets.fromLTRB(268, 322, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/17-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth17Detail(context)));
                    }),
              ),
              Container(
                width: 53,
                height: 53,
                margin: EdgeInsets.fromLTRB(268, 358, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/18-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth18Detail(context)));
                    }),
              ),
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.fromLTRB(264, 390, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/19-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth19Detail(context)));
                    }),
              ),
              Container(
                width: 48,
                height: 48,
                margin: EdgeInsets.fromLTRB(257, 419, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/20-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth20Detail(context)));
                    }),
              ),
              Container(
                width: 47,
                height: 47,
                margin: EdgeInsets.fromLTRB(244, 444, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/21-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth21Detail(context)));
                    }),
              ),
              Container(
                width: 42,
                height: 42,
                margin: EdgeInsets.fromLTRB(230, 458, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/22-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth22Detail(context)));
                    }),
              ),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.fromLTRB(215, 470, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/23-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth23Detail(context)));
                    }),
              ),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.fromLTRB(193, 474, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/24-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth24Detail(context)));
                    }),
              ),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.fromLTRB(172, 475, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/25-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth25Detail(context)));
                    }),
              ),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.fromLTRB(152, 472, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/26-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth26Detail(context)));
                    }),
              ),
              Container(
                height: 41,
                width: 41,
                margin: EdgeInsets.fromLTRB(135, 461, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/27-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth27Detail(context)));
                    }),
              ),
              Container(
                height: 46,
                width: 46,
                margin: EdgeInsets.fromLTRB(118, 443, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/28-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth28Detail(context)));
                    }),
              ),
              Container(
                width: 48,
                height: 48,
                margin: EdgeInsets.fromLTRB(102, 415, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/29-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth29Detail(context)));
                    }),
              ),
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.fromLTRB(91, 387, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/30-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth30Detail(context)));
                    }),
              ),
              Container(
                width: 55,
                height: 55,
                margin: EdgeInsets.fromLTRB(82, 356, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/31-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth31Detail(context)));
                    }),
              ),
              Container(
                width: 55,
                height: 55,
                margin: EdgeInsets.fromLTRB(84, 320, 00, 0),
                child: IconButton(
                    icon: Image.asset('images/tooth/32-lastest.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => tooth32Detail(context)));
                    }),
              ),
            ],
          ),
        ));
  }
}

Widget number(){
  
}
