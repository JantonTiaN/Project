import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Patient/patient_menu_screen.dart';

class PatientHistoryScreen extends StatefulWidget {
  final FirebaseUser user;
  PatientHistoryScreen(this.user, {Key key}) : super(key: key);
  @override
  _PatientHistoryScreenState createState() => _PatientHistoryScreenState();
}

class _PatientHistoryScreenState extends State<PatientHistoryScreen> {
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
        .collection('History');

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
        title: Text('Your Dental History'),
        backgroundColor: Colors.blue[300],
        automaticallyImplyLeading: false,
      ),
    );
  }
}
