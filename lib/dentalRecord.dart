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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text('Upper'), Text('Lower')],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text('Right'), Text('Left')],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(63, 0, 65, 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('1'), Text('16')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(65, 0, 68, 150),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('2'), Text('15')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(72, 0, 75, 220),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('3'), Text('14')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(82, 0, 85, 280),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('4'), Text('13')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(98, 0, 102, 335),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('5'), Text('12')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(118, 0, 121, 385),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('6'), Text('11')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(143, 0, 150, 430),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('7'), Text('10')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(177, 0, 194, 450),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('8'), Text('9')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(56, 100, 62, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('32'), Text('17')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(60, 180, 65, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('31'), Text('18')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(67, 250, 72, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('30'), Text('19')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(82, 320, 85, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('29'), Text('20')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(102, 380, 105, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('28'), Text('21')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(128, 425, 135, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('27'), Text('22')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(155, 448, 163, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('26'), Text('23')],
                  )),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(182, 460, 188, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('25'), Text('24')],
                  )),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.84,
                  height: MediaQuery.of(context).size.height * 0.84,
                  child: Image.asset('images/tooth/AllGum.png'),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.052,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.052,
                margin: EdgeInsets.fromLTRB(84.5, 220, 0, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.048,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.048,
                margin: EdgeInsets.fromLTRB(85, 192, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.047,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.047,
                margin: EdgeInsets.fromLTRB(91, 164, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.046,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.046,
                margin: EdgeInsets.fromLTRB(99, 141, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.044,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.044,
                margin: EdgeInsets.fromLTRB(113, 119, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.039,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.039,
                margin: EdgeInsets.fromLTRB(130, 104, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.039,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.039,
                margin: EdgeInsets.fromLTRB(143.5, 88, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.039,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.039,
                margin: EdgeInsets.fromLTRB(165, 82, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.039,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.039,
                margin: EdgeInsets.fromLTRB(189, 80, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.039,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.039,
                margin: EdgeInsets.fromLTRB(210, 85, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.039,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.039,
                margin: EdgeInsets.fromLTRB(227, 100, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.044,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.044,
                margin: EdgeInsets.fromLTRB(238, 113.5, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.046,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.046,
                margin: EdgeInsets.fromLTRB(251, 135, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.046,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.046,
                margin: EdgeInsets.fromLTRB(261, 159, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.05,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.05,
                margin: EdgeInsets.fromLTRB(265, 184.5, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.052,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.052,
                margin: EdgeInsets.fromLTRB(264, 216, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.052,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.052,
                margin: EdgeInsets.fromLTRB(268, 301, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.049,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.049,
                margin: EdgeInsets.fromLTRB(268, 340, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.046,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.046,
                margin: EdgeInsets.fromLTRB(265, 374, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.044,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.044,
                margin: EdgeInsets.fromLTRB(257, 404, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.041,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.041,
                margin: EdgeInsets.fromLTRB(244, 429, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.037,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.037,
                margin: EdgeInsets.fromLTRB(230, 446, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.037,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.037,
                margin: EdgeInsets.fromLTRB(215, 458, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.036,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.036,
                margin: EdgeInsets.fromLTRB(194, 464, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.036,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.036,
                margin: EdgeInsets.fromLTRB(173, 465, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.036,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.036,
                margin: EdgeInsets.fromLTRB(152, 461, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.036,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.036,
                margin: EdgeInsets.fromLTRB(136, 451, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.042,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.042,
                margin: EdgeInsets.fromLTRB(118, 429, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.044,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.044,
                margin: EdgeInsets.fromLTRB(103, 400, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.046,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.046,
                margin: EdgeInsets.fromLTRB(91, 371, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.05,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.05,
                margin: EdgeInsets.fromLTRB(82, 338, 00, 0),
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
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio *
                    0.05,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio *
                    0.05,
                margin: EdgeInsets.fromLTRB(84, 302, 00, 0),
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
