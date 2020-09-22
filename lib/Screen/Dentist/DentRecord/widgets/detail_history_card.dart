import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailHistoryCard extends StatelessWidget {
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
      //     ListView(
      //   padding: EdgeInsets.only(top: 50),
      //   children: <Widget>[
      //     Card(
      //       child: Container(
      //         height: 100.0,
      //         child: Row(
      //           children: <Widget>[Text('Card no.1')],
      //         ),
      //       ),
      //     ),
      //     FittedBox(
      //       child: GestureDetector(
      //         onTap: () {
      //           // Navigator.push(context, MaterialPageRoute(
      //           //   builder: (context) {
      //           //     return SignInScreen();
      //           //   },
      //           // ));
      //         },
      //         child: Container(
      //           margin: EdgeInsets.only(bottom: 55),
      //           padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      //           decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(3.0),
      //             color: Colors.black,
      //           ),
      //           child: Row(
      //             children: <Widget>[
      //               Text(
      //                 "START CHECK UP",
      //                 style: Theme.of(context)
      //                     .textTheme
      //                     .button
      //                     .copyWith(color: Colors.white),
      //               ),
      //               SizedBox(width: 10),
      //               Icon(
      //                 Icons.arrow_forward,
      //                 color: Colors.white,
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // )
    );
  }
}
