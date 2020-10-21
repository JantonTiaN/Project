import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fundee/Screen/Patient/patient_show_sug.dart';

class PatientSuggestion extends StatefulWidget {
  final FirebaseUser user;
  PatientSuggestion(this.user, {Key key}) : super(key: key);
  @override
  _PatientSuggestionState createState() => _PatientSuggestionState();
}

String clinic;
void patientClinic(String listClinic) {
  clinic = listClinic;
}

class _PatientSuggestionState extends State<PatientSuggestion> {
  Firestore _firestore = Firestore.instance;
  List<DocumentSnapshot> _suggestion = [];
  bool _loadingSuggestion = true;

  _getSuggestion() async {
    Query q = _firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(clinic)
        .document(clinic)
        .collection('Patients')
        .document(widget.user.uid)
        .collection('Suggestion');
    // .orderBy('date');

    setState(() {
      _loadingSuggestion = true;
    });

    QuerySnapshot querySnapshot = await q.getDocuments();
    _suggestion = querySnapshot.documents;

    setState(() {
      _loadingSuggestion = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _getSuggestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestion'),
        backgroundColor: Colors.blue[300],
        automaticallyImplyLeading: false,
      ),
      body: _loadingSuggestion == true
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
                    'Loading',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  )
                ],
              ),
            ))
          : Container(
              child: _suggestion.length == 0
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
                            'Sorry',
                            style: TextStyle(
                                fontFamily: 'Kanit',
                                color: Colors.blue[300],
                                fontSize: 25),
                          ),
                          Text(
                            'You don\'t have any suggestion',
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
                      itemCount: _suggestion.length,
                      itemBuilder: (BuildContext ctx, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SuggestionDetailScreen()));
                          },
                          child: ListTile(
                            // leading: CircleAvatar(
                            //     child: ClipOval(
                            //   child: Image.network(
                            //       _patient[index].data['pathImage']),
                            // )),
                            title: Text(_suggestion[index].data['suggestion']),
                            // subtitle: Text(_patient[index].data['date']),
                          ),
                        );
                      }),
            ),
    );
  }
}
