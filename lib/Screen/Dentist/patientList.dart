import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';
import 'package:fundee/font_awesome_flutter.dart';

import 'DentRecord/dentalRecord.dart';

class PatientList extends StatefulWidget {
  final FirebaseUser user;
  PatientList(this.user, {Key key}) : super(key: key);
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _patient = [];
  bool _loadingPatient = true;

  _getPatient() async {
    Query q = _firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(clinic)
        .document(clinic)
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

  @override
  void initState() {
    super.initState();
    _getPatient();
    getClinic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patients'),
        backgroundColor: Colors.blue[300],
        automaticallyImplyLeading: false,
      ),
      body: _loadingPatient == true
          ? Container(
              child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SpinKitChasingDots(
                    color: Colors.blue[100],
                    size: 50,
                  ),
                  Text(
                    'Loading...',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )
                ],
              ),
            ))
          : Container(
              child: _patient.length == 0
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/Logo/No-data.png',
                            width: 150,
                            height: 150,
                          ),
                          Text(
                            'Oh...',
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                color: Colors.blue[300],
                                fontSize: 25),
                          ),
                          Text(
                            'You don\'t have any patient',
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                color: Colors.blue[300],
                                fontSize: 16),
                          ),
                          // )
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: _patient.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return GestureDetector(
                          onTap: () {
                            clearData();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DentalRecord(
                                          uid: _patient[index].data['uid'],
                                          fullname:
                                              _patient[index].data['fullName'],
                                        )));
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                                child: ClipOval(
                              child: Image.network(
                                  _patient[index].data['pathImage']),
                            )),
                            trailing: Icon(FontAwesomeIcons.chevronRight),
                            title: Text(_patient[index].data['fullName']),
                            subtitle: Text(_patient[index].data['tel']),
                          ),
                        );
                      }),
            ),
    );
  }

  clearData() {
    finishedHistory.clear();
    onProgressHistory.clear();
    tooth1Front.clear();
    tooth2Front.clear();
    tooth3Front.clear();
    tooth4Front.clear();
    tooth5Front.clear();
    tooth6Front.clear();
    tooth7Front.clear();
    tooth8Front.clear();
    tooth9Front.clear();
    tooth10Front.clear();
    tooth11Front.clear();
    tooth12Front.clear();
    tooth13Front.clear();
    tooth14Front.clear();
    tooth15Front.clear();
    tooth16Front.clear();
    tooth17Front.clear();
    tooth18Front.clear();
    tooth19Front.clear();
    tooth20Front.clear();
    tooth21Front.clear();
    tooth22Front.clear();
    tooth23Front.clear();
    tooth24Front.clear();
    tooth25Front.clear();
    tooth26Front.clear();
    tooth27Front.clear();
    tooth28Front.clear();
    tooth29Front.clear();
    tooth30Front.clear();
    tooth31Front.clear();
    tooth32Front.clear();
    tooth1Middle.clear();
    tooth2Middle.clear();
    tooth3Middle.clear();
    tooth4Middle.clear();
    tooth5Middle.clear();
    tooth6Middle.clear();
    tooth7Middle.clear();
    tooth8Middle.clear();
    tooth9Middle.clear();
    tooth10Middle.clear();
    tooth11Middle.clear();
    tooth12Middle.clear();
    tooth13Middle.clear();
    tooth14Middle.clear();
    tooth15Middle.clear();
    tooth16Middle.clear();
    tooth17Middle.clear();
    tooth18Middle.clear();
    tooth19Middle.clear();
    tooth20Middle.clear();
    tooth21Middle.clear();
    tooth22Middle.clear();
    tooth23Middle.clear();
    tooth24Middle.clear();
    tooth25Middle.clear();
    tooth26Middle.clear();
    tooth27Middle.clear();
    tooth28Middle.clear();
    tooth29Middle.clear();
    tooth30Middle.clear();
    tooth31Middle.clear();
    tooth32Middle.clear();
    tooth1Back.clear();
    tooth2Back.clear();
    tooth3Back.clear();
    tooth4Back.clear();
    tooth5Back.clear();
    tooth6Back.clear();
    tooth7Back.clear();
    tooth8Back.clear();
    tooth9Back.clear();
    tooth10Back.clear();
    tooth11Back.clear();
    tooth12Back.clear();
    tooth13Back.clear();
    tooth14Back.clear();
    tooth15Back.clear();
    tooth16Back.clear();
    tooth17Back.clear();
    tooth18Back.clear();
    tooth19Back.clear();
    tooth20Back.clear();
    tooth21Back.clear();
    tooth22Back.clear();
    tooth23Back.clear();
    tooth24Back.clear();
    tooth25Back.clear();
    tooth26Back.clear();
    tooth27Back.clear();
    tooth28Back.clear();
    tooth29Back.clear();
    tooth30Back.clear();
    tooth31Back.clear();
    tooth32Back.clear();
  }
}
