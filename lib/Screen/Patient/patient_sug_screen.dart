import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Patient/patient_menu_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentist_suggestion_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/widgets/detail_history_card.dart';

class PatientSuggestion extends StatefulWidget {
  final FirebaseUser user;
  PatientSuggestion(this.user, {Key key}) : super(key: key);
  @override
  _PatientSuggestionState createState() => _PatientSuggestionState();
}

class _PatientSuggestionState extends State<PatientSuggestion> {
  // FirebaseUser user = FirebaseAuth.instance.currentUser();

  @override
  void initState() {
    super.initState();
    getClinic();
  }

  String suggestion;
  suggestions() {
    Firestore firestore = Firestore.instance;
    firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(patientClinic)
        .document(patientClinic)
        .collection('Patients')
        .document(widget.user.uid)
        .collection('Suggestion')
        .document('suggestion')
        .get()
        .then((value) => {
              if (value.data['suggestion'] == null)
                {suggestion = value.data['suggestion']}
              else
                {suggestion = 'No suggestion !'}
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Suggestion'),
          backgroundColor: Colors.blue[300],
          automaticallyImplyLeading: false,
        ),
        body:
            // StreamBuilder(
            //   stream: Firestore.instance
            //       .collection('Account')
            //       .document('account')
            //       .collection('Patients')
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
            //PREPARING FOR ADD IF FUNCTION !!!
            Center(
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
                'Oops',
                style: TextStyle(
                    fontFamily: 'Kanit', color: Colors.blue[300], fontSize: 25),
              ),
              Text(
                'You don\'t have suggestion',
                style: TextStyle(
                    fontFamily: 'Kanit', color: Colors.blue[300], fontSize: 16),
              ),
              // )
            ],
          ),
        ));
  }
}
