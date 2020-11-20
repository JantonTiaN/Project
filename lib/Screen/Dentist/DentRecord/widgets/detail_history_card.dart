import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/DentRecord/card_detail_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail1_screen.dart';
import 'package:fundee/Screen/constants.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentalRecord.dart';

class DentalHistoryToothCard extends StatefulWidget {
  final FirebaseUser user;
  DentalHistoryToothCard(this.user, {Key key}) : super(key: key);
  @override
  _DentalHistoryToothCardState createState() => _DentalHistoryToothCardState();
}

class _DentalHistoryToothCardState extends State<DentalHistoryToothCard> {
  @override
  void initState() {
    super.initState();
    getClinic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CupertinoButton(
          child: Container(
            height: 80,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.blueGrey),
              // image: DecorationImage(
              //   image:
              //       AssetImage("assets/images/Logo/App-Icon-drop-shadow.jpg"),
              //   fit: BoxFit.cover,
              // ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Case",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Date: 22/09/20",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          onPressed: () {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text('Card is clicked.'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: const Text('ok'),
                    onPressed: () {
                      Navigator.pop(context, 'ok');
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  dentalHistoryToothCard(
      BuildContext context,
      List casesFront,
      List casesMiddle,
      List casesBack,
      List tooth,
      List front,
      List middle,
      List back,
      int toothNum) {
    if (front.isNotEmpty) {
      if (middle.isNotEmpty) {
        if (back.isNotEmpty) {
          return GestureDetector(
            child: Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                color: bCardColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Front : $front',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Text('                            '),
                    Text(
                      'Middle : $middle',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Text('                            '),
                    Text(
                      'Back : $back',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CardDetailScreen()
                          .createState()
                          .toothCardDetail(casesFront, casesMiddle, casesBack,
                              tooth, front, middle, back, toothNum)));
            },
          );
        }
        return GestureDetector(
          child: Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
              color: bCardColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Front : $front',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Middle : $middle',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardDetailScreen()
                        .createState()
                        .toothCardDetail(casesFront, casesMiddle, casesBack,
                            tooth, front, middle, back, toothNum)));
          },
        );
      } else if (back.isNotEmpty) {
        return GestureDetector(
          child: Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
              color: bCardColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Front : $front',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : $back',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardDetailScreen()
                        .createState()
                        .toothCardDetail(casesFront, casesMiddle, casesBack,
                            tooth, front, middle, back, toothNum)));
          },
        );
      } else {
        return GestureDetector(
          child: Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
              color: bCardColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Front : $front',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardDetailScreen()
                        .createState()
                        .toothCardDetail(casesFront, casesMiddle, casesBack,
                            tooth, front, middle, back, toothNum)));
          },
        );
      }
    } else if (middle.isNotEmpty) {
      if (back.isNotEmpty) {
        return GestureDetector(
          child: Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
              color: bCardColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Middle : $middle',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  Text('                            '),
                  Text(
                    'Back : $back',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardDetailScreen()
                        .createState()
                        .toothCardDetail(casesFront, casesMiddle, casesBack,
                            tooth, front, middle, back, toothNum)));
          },
        );
      } else {
        return GestureDetector(
          child: Container(
            height: 300,
            width: 200,
            decoration: BoxDecoration(
              color: bCardColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Middle : $middle',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CardDetailScreen()
                        .createState()
                        .toothCardDetail(casesFront, casesMiddle, casesBack,
                            tooth, front, middle, back, toothNum)));
          },
        );
      }
    } else if (back.isNotEmpty) {
      return GestureDetector(
        child: Container(
          height: 300,
          width: 200,
          decoration: BoxDecoration(
            color: bCardColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Back : $back',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CardDetailScreen()
                      .createState()
                      .toothCardDetail(casesFront, casesMiddle, casesBack,
                          tooth, front, middle, back, toothNum)));
        },
      );
    }
    if (front.isEmpty && middle.isEmpty && back.isEmpty) {
      return Container(
        height: 80,
        width: 200,
        decoration: BoxDecoration(
          color: bCardColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'No Case',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      );
    }
  }
}

String uid;
void toothid(String getidtohis) {
  uid = getidtohis;
}
