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

String clinic;
void patientClinic(String listClinic) {
  clinic = listClinic;
}

class _PatientListState extends State<PatientList> {
  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _patient = [];
  bool _loadingPatient = true;
  PatientDatabase _patientdb = new PatientDatabase();
  Stream patientStream;
  OurPatients patient;

  _getPatient() async {
    Query q = _firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        // .collection('Patients')
        // .document(patient.patientClinic)
        .collection('Patients')
        .orderBy('fullName');

    setState(() {
      _loadingPatient = true;
    });

    QuerySnapshot querySnapshot = await q.getDocuments();
    _patient = querySnapshot.documents;

    setState(() {
      _loadingPatient = false;
    });
  }

  // Widget patientList() {
  //   return Container(
  //     child: patientStream != null
  //         ? Column(
  //             children: <Widget>[
  //               StreamBuilder(
  //                 stream: patientStream,
  //                 builder: (context, snapshot) {
  //                   return ListView.builder(
  //                       itemCount: snapshot.data.documents.length,
  //                       shrinkWrap: true,
  //                       itemBuilder: (context, index) {
  //                         return PatientTile(
  //                           fullname:
  //                               snapshot.data.documents[index].data['fullName'],
  //                           tel: snapshot.data.documents[index].data['tel'],
  //                           pathImage: snapshot
  //                               .data.documents[index].data['pathImage'],
  //                         );
  //                       });
  //                 },
  //               ),
  //             ],
  //           )
  //         : Center(
  //             child: Column(
  //               children: <Widget>[
  //                 CircularProgressIndicator(),
  //                 Text(
  //                   'รอสักครู่...',
  //                   style: TextStyle(fontFamily: 'Kanit'),
  //                 )
  //               ],
  //             ),
  //           ),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    _getPatient();
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
      body: _loadingPatient == true
          ? Container(
              child: Center(
              child: Text('Loading...'),
            ))
          : Container(
              child: _patient.length == 0
                  ? Center(
                      child: Text('No Patient'),
                    )
                  : ListView.builder(
                      itemCount: _patient.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return ListTile(
                          leading: CircleAvatar(
                              child: ClipOval(
                            child: Image.network(
                                _patient[index].data['pathImage']),
                          )),
                          title: Text(_patient[index].data['fullName']),
                        );
                      }),
            ),
      // body: patientList(),
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
  final String fullname;
  final String tel;
  final String pathImage;
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
