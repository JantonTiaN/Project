import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PatientHistoryScreen extends StatefulWidget {
  final FirebaseUser user;
  PatientHistoryScreen(this.user, {Key key}) : super(key: key);
  @override
  _PatientHistoryScreenState createState() => _PatientHistoryScreenState();
}

class _PatientHistoryScreenState extends State<PatientHistoryScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Dental History'),
          backgroundColor: Colors.blue[300],
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Image.asset(
                  'assets/images/Logo/No-data.png',
                  width: 150,
                  height: 150,
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 100),
              // child:
              Text(
                'Soory',
                style: TextStyle(
                    fontFamily: 'Kanit', color: Colors.blue[300], fontSize: 25),
              ),
              Text(
                'You don\'t have history',
                style: TextStyle(
                    fontFamily: 'Kanit', color: Colors.blue[300], fontSize: 16),
              ),
              // )
            ],
          ),
        )
        // StreamBuilder(
        //   stream: Firestore.instance
        //       .collection('Account')
        //       .document('account')
        //       .collection('Patient')
        //       .document(widget.user.uid)
        //       .collection('Suggestion')
        //       // .document('suggesion')
        //       .snapshots(),
        //   builder: (context, snapshot) {
        //     if (!snapshot.hasData) {
        //       return Center(
        //         child: Padding(
        //           padding: const EdgeInsets.only(top: 100),
        //           child: Column(
        //             children: <Widget>[
        //               CircularProgressIndicator(),
        //               Text('Loading...'),
        //             ],
        //           ),
        //         ),
        //       );
        //     } else {
        //       return ListView.builder(
        //         itemCount: snapshot.data.documents.length,
        //         itemBuilder: (context, index) {
        //           return Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Card(
        //               child: Container(
        //                 child: InkWell(
        //                   onTap: () {},
        //                   child: Column(
        //                     children: <Widget>[
        //                       ListTile(
        //                         title: Text(snapshot
        //                             .data.documents[index].data["suggestion"]),
        //                       ),
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),
        );
  }
}
