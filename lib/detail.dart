// import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fundee/models/account_model.dart';
import 'package:fundee/models/user_model.dart';
import 'package:fundee/dentalCase.dart';

class User extends StatefulWidget {
  @override
  _UserState createState() => _UserState();
}

class _UserState extends State<User> {
  List<UserModel> userModels = List();
  List<AccountModel> accountModels = List();

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Account').document('6WzZ7oB9langXaG7lU0J').collection('User');
    await collectionReference.snapshots().listen((response) {
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
            child: ListView.builder(
                itemCount: userModels.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  return Container(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(200, 180, 0, 0),
                      
                      child: Text(userModels[index].firstName + ' ' +userModels[index].lastName, style: TextStyle(fontSize: 15, color: Colors.black))
                      )
                    );
                })),
      ],
    );
  }
}

Widget tooth1Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth1 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth2Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth2 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth3Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth3 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth4Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth4 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth5Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth5 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth6Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth6 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth7Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth7 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth8Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth8 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth9Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth9 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth10Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth10 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth11Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth11 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth12Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth12 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth13Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth13 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth14Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth14 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth15Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth15 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth16Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth16 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth17Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth17 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth18Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth18 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth19Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth19 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth20Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth20 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth21Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth21 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth22Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth22 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth23Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth23 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth24Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth24 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth25Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth25 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth26Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth26 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth27Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth27 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth28Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth28 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth29Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth29 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth30Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth30 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth31Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth31 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}

Widget tooth32Detail(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Tooth32 Detail')),
      body: Center(
          child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 220, 0),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              color: Colors.grey[300],
              child: Stack(
                children: <Widget>[
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
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
                                  builder: (context) => DentalCase()));
                        }),
                  )
                ],
              ))));
}
