import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail1_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail2_screen.dart';
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
    case1Front.clear();
    case2Front.clear();
    case3Front.clear();
    case4Front.clear();
    case5Front.clear();
    case6Front.clear();
    case7Front.clear();
    case8Front.clear();
    case9Front.clear();
    case10Front.clear();
    case11Front.clear();
    case12Front.clear();
    case13Front.clear();
    case14Front.clear();
    case15Front.clear();
    case16Front.clear();
    case17Front.clear();
    case18Front.clear();
    case19Front.clear();
    case20Front.clear();
    case21Front.clear();
    case22Front.clear();
    case23Front.clear();
    case24Front.clear();
    case25Front.clear();
    case26Front.clear();
    case27Front.clear();
    case28Front.clear();
    case29Front.clear();
    case30Front.clear();
    case31Front.clear();
    case32Front.clear();
    case1Middle.clear();
    case2Middle.clear();
    case3Middle.clear();
    case4Middle.clear();
    case5Middle.clear();
    case6Middle.clear();
    case7Middle.clear();
    case8Middle.clear();
    case9Middle.clear();
    case10Middle.clear();
    case11Middle.clear();
    case12Middle.clear();
    case13Middle.clear();
    case14Middle.clear();
    case15Middle.clear();
    case16Middle.clear();
    case17Middle.clear();
    case18Middle.clear();
    case19Middle.clear();
    case20Middle.clear();
    case21Middle.clear();
    case22Middle.clear();
    case23Middle.clear();
    case24Middle.clear();
    case25Middle.clear();
    case26Middle.clear();
    case27Middle.clear();
    case28Middle.clear();
    case29Middle.clear();
    case30Middle.clear();
    case31Middle.clear();
    case32Middle.clear();
    case1Back.clear();
    case2Back.clear();
    case3Back.clear();
    case4Back.clear();
    case5Back.clear();
    case6Back.clear();
    case7Back.clear();
    case8Back.clear();
    case9Back.clear();
    case10Back.clear();
    case11Back.clear();
    case12Back.clear();
    case13Back.clear();
    case14Back.clear();
    case15Back.clear();
    case16Back.clear();
    case17Back.clear();
    case18Back.clear();
    case19Back.clear();
    case20Back.clear();
    case21Back.clear();
    case22Back.clear();
    case23Back.clear();
    case24Back.clear();
    case25Back.clear();
    case26Back.clear();
    case27Back.clear();
    case28Back.clear();
    case29Back.clear();
    case30Back.clear();
    case31Back.clear();
    case32Back.clear();
    tooth1.clear();
    tooth2.clear();
    tooth3.clear();
    tooth4.clear();
    tooth5.clear();
    tooth6.clear();
    tooth7.clear();
    tooth8.clear();
    tooth9.clear();
    tooth10.clear();
    tooth11.clear();
    tooth12.clear();
    tooth13.clear();
    tooth14.clear();
    tooth15.clear();
    tooth16.clear();
    tooth17.clear();
    tooth18.clear();
    tooth19.clear();
    tooth20.clear();
    tooth21.clear();
    tooth22.clear();
    tooth23.clear();
    tooth24.clear();
    tooth25.clear();
    tooth26.clear();
    tooth27.clear();
    tooth28.clear();
    tooth29.clear();
    tooth30.clear();
    tooth31.clear();
    tooth32.clear();
  }
}
