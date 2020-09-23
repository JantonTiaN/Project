import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentalRecord.dart';
import 'package:fundee/Screen/constants.dart';

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
      // backgroundColor: bBackgroundColor,
      appBar: AppBar(
        title: Text('Patients'),
        backgroundColor: Colors.blue[300],
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection('Account')
            .document('account')
            .collection('Patients')
            .orderBy('fullName')
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Loading..."),
                  ],
                ),
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
                                builder: (context) => DentalRecord(
                                  fullname: snapshot
                                      .data.documents[index].data["fullName"],
                                  tel:
                                      snapshot.data.documents[index].documentID,
                                ),
                                // PatientInfo(
                                //       fullname: snapshot.data.documents[index]
                                //           .data["fullName"],
                                //       tel: snapshot
                                //           .data.documents[index].documentID,
                                //     )
                              ));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalRecord(
                          //               fullname: snapshot.data.documents[index]
                          //                   .data["fullName"],
                          //               tel: snapshot
                          //                   .data.documents[index].documentID,
                          //             )
                          //         // PatientInfo(
                          //         //       fullname: snapshot.data.documents[index]
                          //         //           .data["fullName"],
                          //         //       tel: snapshot
                          //         //           .data.documents[index].documentID,
                          //         //     )
                          //         ));
                        },
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: Text(snapshot
                                  .data.documents[index].data["fullName"]),
                              subtitle: Text(
                                  snapshot.data.documents[index].documentID),
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
