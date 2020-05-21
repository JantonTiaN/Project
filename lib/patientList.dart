import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fundee/patientForm.dart';
import 'package:fundee/patientInfo.dart';

import 'models/user_model.dart';


class PatientList extends StatefulWidget {
  @override
  _PatientListState createState() => _PatientListState();
}

class _PatientListState extends State<PatientList> {
  @override

//   List<UserModel> userModels = List();

// Future<void> readAllData() async {
//     Firestore firestore = Firestore.instance;
//     CollectionReference collectionReference = firestore.collection('Account').document('account').collection('Users');
//     collectionReference.snapshots().listen((response) {
//       List<DocumentSnapshot> snapshots = response.documents;
//       for (var snapshot in snapshots) {
//         UserModel userModel = UserModel.fromMap(snapshot.data);
//         setState(() {
//           userModels.add(userModel);
//         });
//       }
//     }); 
//   }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Patients')),
    floatingActionButton: FloatingActionButton(
      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PatientForm())),
      child: Text("+"),
    ),
    body: StreamBuilder(
      stream: Firestore.instance.collection("Account").document('account').collection('Users').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("กำลังโหลด"),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Container(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PatientInfo(
                                          firstname: snapshot
                                              .data.documents[index].data["firstName"],
                                          fname: snapshot
                                              .data
                                              .documents[index]
                                              .documentID,
                                        )));
                          },
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                    snapshot.data.documents[index].data["firstName"]),
                                subtitle: Text(snapshot
                                    .data.documents[index].documentID),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            } 
          },
        ),
    );
  }
}