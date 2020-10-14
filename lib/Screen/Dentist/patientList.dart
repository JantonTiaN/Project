import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Services/database.dart';
import 'package:fundee/models/users.dart';

class PatientList extends StatefulWidget {
  final FirebaseUser user;
  PatientList(this.user, {Key key}) : super(key: key);
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  Firestore _firestore = Firestore.instance;
  // List<PatientSnapshot> _patient = [];
  PatientDatabase _patientdb = new PatientDatabase();
  Stream patientStream;
  OurPatients patient;

  Widget _PatientList() {
    return Container(
      child: patientStream != null
          ? Column(
              children: <Widget>[
                StreamBuilder(
                  stream: patientStream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                        itemCount: snapshot.data.documents.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PatientTile(
                            fullname:
                                snapshot.data.documents[index].data['fullName'],
                            tel: snapshot.data.documents[index].data['tel'],
                            pathImage: snapshot
                                .data.documents[index].data['pathImage'],
                          );
                        });
                  },
                ),
              ],
            )
          : Center(
              child: Column(
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text(
                    'รอสักครู่...',
                    style: TextStyle(fontFamily: 'Kanit'),
                  )
                ],
              ),
            ),
    );
  }

  @override
  void initState() {
    _patientdb.getPatient().then((result) {
      setState(() {
        patientStream = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: bBackgroundColor,
      appBar: AppBar(
        title: Text('Patients'),
        backgroundColor: Colors.blue[300],
        automaticallyImplyLeading: false,
      ),
      body: _PatientList(),
      // StreamBuilder(
      //   stream: Firestore.instance
      //       .collection('FunD')
      //       .document('funD')
      //       .collection('Clinic')
      //       .document('clinic')
      //       .collection(patient.patientClinic)
      //       .document(patient.patientClinic)
      //       .collection('Patients')
      //       .orderBy('fullName')
      //       .snapshots(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: Padding(
      //           padding: const EdgeInsets.only(top: 100),
      //           child: Column(
      //             children: <Widget>[
      //               CircularProgressIndicator(),
      //               Text("Loading..."),
      //             ],
      //           ),
      //         ),
      //       );
      //     } else {
      //       return ListView.builder(
      //         itemCount: snapshot.data.documents.length,
      //         itemBuilder: (context, index) {
      // return Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: Card(
      //     child: Container(
      //       child: InkWell(
      //         onTap: () {
      //           suggestionuid(
      //               snapshot.data.documents[index].data['uid']);
      //           Navigator.push(
      //               context,
      //               MaterialPageRoute(
      //                 builder: (context) => DentalRecord(
      //                   fullname: snapshot
      //                       .data.documents[index].data["fullName"],
      //                   drugAllergy: snapshot.data.documents[index]
      //                       .data['drugAllergy'],
      //                   uid: snapshot
      //                       .data.documents[index].data['uid'],
      //                 ),
      //               ));
      //                   },
      //                   child: Column(
      //                     children: <Widget>[
      //                       ListTile(
      //                           title: Text(snapshot
      //                               .data.documents[index].data["fullName"]),
      //                           subtitle: Text(
      //                             snapshot.data.documents[index]
      //                                 .data['drugAllergy'],
      //                           )),
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

class PatientTile extends StatelessWidget {
  String fullname, tel, pathImage;
  PatientTile(
      {@required this.fullname, @required this.tel, @required this.pathImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Stack(
        children: <Widget>[
          ClipOval(
            child: new SizedBox(
                width: 20.0,
                height: 20.0,
                child: Image.network(
                  pathImage,
                  fit: BoxFit.fill,
                )),
          ),
          Container(
            height: 100,
            child: Column(
              children: <Widget>[
                Text(fullname),
                SizedBox(
                  height: 4,
                ),
                Text(tel),
              ],
            ),
          )
        ],
      ),
    );
  }
}
