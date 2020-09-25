import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/DentRecord/record_history_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentist_suggestion_screen.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'dental_detail_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentist_suggestion_screen.dart';

class DentalRecord extends StatefulWidget {
  final String fullname;
  final String drugAllergy;
  final String uid;
  DentalRecord(
      {Key key,
      @required this.fullname,
      @required this.drugAllergy,
      @required this.uid})
      : super(key: key);
  @override
  _DentalRecordState createState() => _DentalRecordState();
}

class _DentalRecordState extends State<DentalRecord> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.fullname),
          backgroundColor: Colors.blue[300],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                  child: Center(
                    child: Text(
                      'Upper',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 555, 0, 0),
                  child: Center(
                    child: Text(
                      'Lower',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 295, 280, 0),
                  child: Center(
                    child: Text(
                      'Right',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(280, 295, 0, 0),
                  child: Center(
                    child: Text(
                      'Left',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(290, 540, 0, 0),
                  child: FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return RecordHistoryScreen();
                          },
                        ));
                      },
                      child: Container(
                        // margin: EdgeInsets.
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(25),
                            color: Colors.amber,
                            shape: BoxShape.circle),
                        child: Row(
                          children: <Widget>[
                            // Text(
                            //   'History',
                            //   style: TextStyle(fontSize: 20),
                            // ),
                            // SizedBox(width: 10),
                            Icon(
                              Icons.history,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(240, 540, 0, 0),
                  child: FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return DentSuggestionScreen();
                          },
                        ));
                      },
                      child: Container(
                        // margin: EdgeInsets.
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 11),
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(25),
                            color: Colors.amber,
                            shape: BoxShape.circle),
                        child: Row(
                          children: <Widget>[
                            // Text(
                            //   'History',
                            //   style: TextStyle(fontSize: 20),
                            // ),
                            // SizedBox(width: 10),
                            Icon(
                              LineAwesomeIcons.medical_notes,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 255, 280, 0),
                  child: Center(
                    child: Text(
                      '1',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 220, 280, 0),
                  child: Center(
                    child: Text(
                      '2',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 185, 275, 0),
                  child: Center(
                    child: Text(
                      '3',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 150, 255, 0),
                  child: Center(
                    child: Text(
                      '4',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 123, 220, 0),
                  child: Center(
                    child: Text(
                      '5',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 95, 185, 0),
                  child: Center(
                    child: Text(
                      '6',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 68, 128, 0),
                  child: Center(
                    child: Text(
                      '7',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 55, 40, 0),
                  child: Center(
                    child: Text(
                      '8',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(35, 55, 0, 0),
                  child: Center(
                    child: Text(
                      '9',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(128, 68, 0, 0),
                  child: Center(
                    child: Text(
                      '10',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(185, 95, 0, 0),
                  child: Center(
                    child: Text(
                      '11',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(220, 123, 0, 0),
                  child: Center(
                    child: Text(
                      '12',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(255, 150, 0, 0),
                  child: Center(
                    child: Text(
                      '13',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(275, 185, 0, 0),
                  child: Center(
                    child: Text(
                      '14',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(280, 220, 0, 0),
                  child: Center(
                    child: Text(
                      '15',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(280, 255, 0, 0),
                  child: Center(
                    child: Text(
                      '16',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(290, 345, 0, 0),
                  child: Center(
                    child: Text(
                      '17',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(280, 385, 0, 0),
                  child: Center(
                    child: Text(
                      '18',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(270, 423, 0, 0),
                  child: Center(
                    child: Text(
                      '19',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(255, 455, 0, 0),
                  child: Center(
                    child: Text(
                      '20',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(220, 485, 0, 0),
                  child: Center(
                    child: Text(
                      '21',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(170, 510, 0, 0),
                  child: Center(
                    child: Text(
                      '22',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(110, 525, 0, 0),
                  child: Center(
                    child: Text(
                      '23',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 535, 0, 0),
                  child: Center(
                    child: Text(
                      '24',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 535, 35, 0),
                  child: Center(
                    child: Text(
                      '25',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 525, 105, 0),
                  child: Center(
                    child: Text(
                      '26',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 510, 170, 0),
                  child: Center(
                    child: Text(
                      '27',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 485, 220, 0),
                  child: Center(
                    child: Text(
                      '28',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 455, 255, 0),
                  child: Center(
                    child: Text(
                      '29',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 420, 275, 0),
                  child: Center(
                    child: Text(
                      '30',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 385, 280, 0),
                  child: Center(
                    child: Text(
                      '31',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 345, 290, 0),
                  child: Center(
                    child: Text(
                      '32',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Center(
                    child: Image.asset(
                      'images/tooth/AllGum-lastest.png',
                      scale: 4.3,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth1Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 243, 200, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/1-lastest.png',
                        scale: 25,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth2Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 211, 200, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/2-lastest.png',
                        scale: 27,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth3Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 180.5, 190, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/3-lastest.png',
                        scale: 28,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth4Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 155, 175, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/4-lastest.png',
                        scale: 29,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth5Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 131, 153, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/5-lastest.png',
                        scale: 31,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth6Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 111, 115, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/6-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth7Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 91, 80, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/7-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth8Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 84, 29, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/8-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth9Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(27.5, 84, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/9-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth10Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(78, 92, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/10-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth11Detail(context)));
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(113, 110, 0, 0),
                      child: Center(
                        child: Image.asset(
                          'images/tooth/11-lastest.png',
                          scale: 34,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth12Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(143, 128.5, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/12-lastest.png',
                        scale: 31,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth13Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(172, 151.5, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/13-lastest.png',
                        scale: 29,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth14Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(185, 178, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/14-lastest.png',
                        scale: 28,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth15Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(197, 207.5, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/15-lastest.png',
                        scale: 27,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth16Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(198, 239.5, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/16-lastest.png',
                        scale: 25,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth17Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(203, 330, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/17-lastest.png',
                        scale: 25,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth18Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(203, 370, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/18-lastest.png',
                        scale: 26,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth19Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(191, 405, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/19-lastest.png',
                        scale: 29,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth20Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(171, 435, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/20-lastest.png',
                        scale: 31,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth21Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(140, 461, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/21-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth22Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(104, 478, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/22-lastest.png',
                        scale: 39,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth23Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(74, 492, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/23-lastest.png',
                        scale: 39,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth24Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(26, 498, 00, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/24-lastest.png',
                        scale: 40,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth25Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 498, 22, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/25-lastest.png',
                        scale: 40,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth26Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 493, 69, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/26-lastest.png',
                        scale: 40,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth27Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 480, 101, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/27-lastest.png',
                        scale: 40,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth28Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 460, 134, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/28-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth29Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 431, 165, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/29-lastest.png',
                        scale: 31,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth30Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 400.5, 185, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/30-lastest.png',
                        scale: 29,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth31Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 369, 200, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/31-lastest.png',
                        scale: 27,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getuid(widget.uid);
                    getuserid(widget.uid);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth32Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 330, 200, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/32-lastest.png',
                        scale: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
