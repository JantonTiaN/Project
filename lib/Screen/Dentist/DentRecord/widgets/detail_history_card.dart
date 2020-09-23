import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/constants.dart';

class DentailHistoryCard extends StatefulWidget {
  @override
  _DentailHistoryCardState createState() => _DentailHistoryCardState();
}

class _DentailHistoryCardState extends State<DentailHistoryCard> {
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
}

Widget dentailHistoryCard() {
  return Container(
    height: 80,
    width: 200,
    decoration: BoxDecoration(
      color: bCardColor.withOpacity(0.6),
      // border: Border.all(color: Colors.blueGrey, width: 2),
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
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
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
  );
}
