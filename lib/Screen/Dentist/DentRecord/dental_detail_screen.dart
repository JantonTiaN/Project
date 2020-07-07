import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_case_screen.dart';
import 'package:fundee/models/account_model.dart';
import 'package:fundee/models/user_model.dart';

class DentalDetailScreen extends StatefulWidget {
  @override
  _DentalDetailScreenState createState() => _DentalDetailScreenState();
}

class _DentalDetailScreenState extends State<DentalDetailScreen> {
  List<UserModel> userModels = List();
  List<AccountModel> accountModels = List();

  @override
  void initState() {
    super.initState();
    readFirestore();
  }

  Future<void> readFirestore() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference =
        firestore.collection('Account').document('account').collection('Users');
    collectionReference.snapshots().listen((response) {
      List<DocumentSnapshot> snapshots = response.documents;
      for (var snapshot in snapshots) {
        UserModel userModel = UserModel.fromMap(snapshot.data);
        setState(() {
          userModels.add(userModel);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: tooth1Detail(context),
        ),
        Container(
            padding: EdgeInsets.all(0.3),
            color: Colors.grey[300],
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.0,
            margin: EdgeInsets.fromLTRB(20, 180, 0, 0),
            child: ListView.builder(
                itemCount: userModels.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  return Container(
                      child: Container(
                          child: Text(
                              ' ' +
                                  userModels[index].firstName +
                                  ' ' +
                                  userModels[index].lastName,
                              style: TextStyle(
                                  fontSize: 15, color: Colors.black))));
                })),
      ],
    );
  }
}

Widget tooth1Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 1 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (R) Third Molar"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/1-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/1-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/1-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth2Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 2 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (R) Second Molar"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/2-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/2-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/2-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth3Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 3 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (R) First Molar"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/3-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/3-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/3-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth4Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 4 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (R) Second Bicuspid"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/4-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/4-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/4-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth5Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 5 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (R) First Bicuspid"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/5-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/5-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/5-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth6Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 6 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (R) Cuspid"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/6-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/6-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/6-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth7Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 7 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (R) Lateral Incisor"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/7-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/7-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/7-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth8Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 8 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (R) Central Incisor"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/8-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/8-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/8-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth9Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 9 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (L) Central Incisor"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/9-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/9-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/9-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth10Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 10 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (L) Lateral Incisor"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/10-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/10-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/10-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth11Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 11 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (L) Cuspid"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/11-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/11-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/11-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth12Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 12 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (L) First Bicuspid"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/12-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/12-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/12-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth13Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 13 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (L) Second Bicuspid"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/13-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/13-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/13-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth14Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 14 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (L) First Molar"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/14-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/14-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/14-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth15Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 15 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (L) Second Molar"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/15-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/15-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/15-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth16Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 16 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Upper (L) Third Molar"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/16-1.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/16-2.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/16-3.png'),
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return SingleChildScrollView(
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                        title: Center(
                                            child: Text("Select Case Symptom")),
                                      ),
                                      ListTile(
                                        title: Text("Dental Caries"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text(
                                            "Attrition, abrasion, abfraction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Fractured tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Retained root"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("RCT tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Extracted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Missing tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/green-circle.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Impacted tooth"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/imp.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Partial eruption"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/pe.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Tilting, drifting"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/arrow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Loss of contact"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/loss-of-contact.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Poor contact point"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/poor-contact-point.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Food impaction"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/food-impaction.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Supraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/plus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Infraclusion"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/minus.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Rotation"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/rotation.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Temporary"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/blue.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Permanentrestoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Gold restoration"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/yellow.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Porcelain/metal crown"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/black.png'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title:
                                            Text("Extract and have fix bridge"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/red-cross.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                      ListTile(
                                        title: Text("Other"),
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              'assets/images/dental_cases/other.jpg'),
                                        ),
                                        onTap: () {
                                          //add to firebase
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth17Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 17 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower (L) Third Molar"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/17-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/17-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/17-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth18Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 18 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(L) Second Molar"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/18-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/18-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/18-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth19Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 19 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(L) First Molar"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/19-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/19-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/19-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth20Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 20 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(L) Second Bicuspid"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/20-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/20-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/20-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth21Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 21 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(L) First Bicuspid"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/21-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/21-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/21-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth22Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 22 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(L) Cuspid"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/22-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/22-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/22-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth23Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 23 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(L) Lateral Incisor"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/23-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/23-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/23-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth24Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 24 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(L) Central Incisor"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/24-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/24-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/24-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth25Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 25 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(R) Central Incisor"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/25-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/25-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/25-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth26Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 26 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(R) Lateral Incisor"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/26-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/26-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/26-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth27Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 27 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(R) Cuspid"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/27-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/27-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/27-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth28Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 28 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(R) First Bicuspid"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/28-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/28-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/28-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth29Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 29 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(R) Second Bicuspid"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/29-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/29-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/29-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth30Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 30 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(R) First Molar"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/30-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/30-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/30-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth31Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 31 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(R) Second Molar"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/31-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/31-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/31-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}

Widget tooth32Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth 32 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              // color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Text("Lower(R) Third Molar"),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/32-1.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.07,
                    margin: EdgeInsets.fromLTRB(15, 130, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/32-2.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio *
                        0.1,
                    margin: EdgeInsets.fromLTRB(0, 210, 0, 0),
                    child: IconButton(
                        icon: Image.asset('images/tooth/detail/32-3.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCaseScreen()));
                        }),
                  )
                ],
              ))));
}
