import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/constants.dart';
import 'dental_detail_screen.dart';
import 'package:fundee/models/account_model.dart';
import 'package:fundee/models/user_model.dart';

class Tooth1 extends StatefulWidget {
  @override
  _Tooth1State createState() => _Tooth1State();
}

class _Tooth1State extends State<Tooth1> {
  List<UserModel> userModels = List();
  List<AccountModel> accountModels = List();

  @override
  void initState() {
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
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
    return Container(
        padding: EdgeInsets.all(0.3),
        // color: Colors.grey[300],
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.03,
        child: ListView.builder(
            itemCount: userModels.length,
            itemBuilder: (BuildContext buildContext, int index) {
              return Container(
                  child: Container(
                      child: Text(
                          ' ' +
                              userModels[6].firstName +
                              ' ' +
                              userModels[6].lastName,
                          style:
                              TextStyle(fontSize: 15, color: Colors.black))));
            }));
  }
}

class DentalRecord extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: bBackgroundColor,
        appBar: AppBar(title: Text('Dental Charting')),
        body: SingleChildScrollView(
          child: Center(
            child: Stack(
              children: <Widget>[
                Container(
                  child: Tooth1(),
                ),
                // Container(
                //   width: MediaQuery.of(context).size.width *
                //       MediaQuery.of(context).devicePixelRatio,
                //   height: MediaQuery.of(context).size.height *
                //       MediaQuery.of(context).devicePixelRatio,
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text('Upper'), Text('Lower')],
                      ),
                    ),
                  ),
                ),
                // ),
                // Container(
                //   width: MediaQuery.of(context).size.width *
                //       MediaQuery.of(context).devicePixelRatio,
                //   height: MediaQuery.of(context).size.height *
                //       MediaQuery.of(context).devicePixelRatio,
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text('Right'), Text('Left')],
                      ),
                    ),
                    // ),
                  ),
                ),
                // Container(
                //     width: MediaQuery.of(context).size.width *
                //         MediaQuery.of(context).devicePixelRatio,
                //     height: MediaQuery.of(context).size.height *
                //         MediaQuery.of(context).devicePixelRatio,
                //     margin: EdgeInsets.fromLTRB(63, 0, 65, 80),
                Padding(
                  padding: const EdgeInsets.fromLTRB(42, 0, 39, 80),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('1'), Text('16')],
                    ),
                  ),
                ),
                // ),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(65, 0, 68, 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('2'), Text('15')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(72, 0, 75, 220),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('3'), Text('14')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(82, 0, 85, 280),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('4'), Text('13')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(98, 0, 102, 335),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('5'), Text('12')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(118, 0, 121, 385),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('6'), Text('11')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(143, 0, 150, 430),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('7'), Text('10')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(177, 0, 194, 450),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('8'), Text('9')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(56, 100, 62, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('32'), Text('17')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(60, 180, 65, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('31'), Text('18')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(67, 250, 72, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('30'), Text('19')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(82, 320, 85, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('29'), Text('20')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(102, 380, 105, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('28'), Text('21')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(128, 425, 135, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('27'), Text('22')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(155, 448, 163, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('26'), Text('23')],
                    )),
                Container(
                    width: MediaQuery.of(context).size.width *
                        MediaQuery.of(context).devicePixelRatio,
                    height: MediaQuery.of(context).size.height *
                        MediaQuery.of(context).devicePixelRatio,
                    margin: EdgeInsets.fromLTRB(182, 460, 188, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[Text('25'), Text('24')],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  // child: Container(
                  //   width: MediaQuery.of(context).size.width *
                  //       MediaQuery.of(context).devicePixelRatio *
                  //       0.33,
                  //   height: MediaQuery.of(context).size.height *
                  //       MediaQuery.of(context).devicePixelRatio *
                  //       0.33,
                  child: Image.asset(
                    'images/tooth/AllGum.png',
                    scale: 1,
                    // width: MediaQuery.of(context).size.width *
                    //     MediaQuery.of(context).devicePixelRatio *
                    //     0.33,
                    // height: MediaQuery.of(context).size.height *
                    //     MediaQuery.of(context).devicePixelRatio *
                    //     0.33,
                  ),
                  // ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth1Detail(context)));
                  },
                  child: Positioned(
                    left: 20.0,
                    top: 150.0,
                    child: Center(
                      // child: Container(
                      //   color: Colors.blue,
                      //   width: MediaQuery.of(context).size.width *
                      //       MediaQuery.of(context).devicePixelRatio *
                      //       0.052,
                      //   height: MediaQuery.of(context).size.height *
                      //       MediaQuery.of(context).devicePixelRatio *
                      //       0.052,
                      //   margin: EdgeInsets.fromLTRB(0, 0, 190, 77),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 212, 190, 0),
                        child: Image.asset('images/tooth/1-lastest.png',
                            scale: 25,
                            // width: MediaQuery.of(context).size.width *
                            //     MediaQuery.of(context).devicePixelRatio *
                            //     0.050,
                            // height: MediaQuery.of(context).size.height *
                            //     MediaQuery.of(context).devicePixelRatio *
                            //     0.050,
                            alignment: Alignment.center,
                            color: Colors.blue),
                      ),
                      // ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth2Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.048,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.048,
                    // margin: EdgeInsets.fromLTRB(0, 0, 190, 141),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 178, 191, 0),
                      child: Image.asset(
                        'images/tooth/2-lastest.png',
                        scale: 27,
                        // width: MediaQuery.of(context).size.width *
                        //     MediaQuery.of(context).devicePixelRatio *
                        //     0.05,
                        // height: MediaQuery.of(context).size.height *
                        //     MediaQuery.of(context).devicePixelRatio *
                        //     0.05,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth3Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.047,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.047,
                    //   margin: EdgeInsets.fromLTRB(0, 0, 180, 200),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 148, 178, 0),
                      child: Image.asset(
                        'images/tooth/3-lastest.png',
                        scale: 28,
                        width: MediaQuery.of(context).size.width *
                            MediaQuery.of(context).devicePixelRatio *
                            0.05,
                        height: MediaQuery.of(context).size.height *
                            MediaQuery.of(context).devicePixelRatio *
                            0.05,
                        color: Colors.black,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth4Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.046,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.046,
                    // margin: EdgeInsets.fromLTRB(0, 0, 166, 249),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 166, 249),
                      child: Image.asset(
                        'images/tooth/4-lastest.png',
                        scale: 29,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth5Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.044,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.044,
                    //   margin: EdgeInsets.fromLTRB(0, 0, 141, 297),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 141, 297),
                      child: Image.asset(
                        'images/tooth/5-lastest.png',
                        scale: 31,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth6Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.040,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.040,
                    //   margin: EdgeInsets.fromLTRB(0, 0, 111, 335),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 111, 335),
                      child: Image.asset(
                        'images/tooth/6-lastest.png',
                        scale: 34,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth7Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.040,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.040,
                    //   margin: EdgeInsets.fromLTRB(0, 0, 80, 368),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 80, 368),
                      child:
                          Image.asset('images/tooth/7-lastest.png', scale: 34),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth8Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.040,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.040,
                    //   margin: EdgeInsets.fromLTRB(0, 0, 35, 380),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 35, 380),
                      child: Image.asset(
                        'images/tooth/8-lastest.png',
                        scale: 34,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth9Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.040,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.040,
                    //   margin: EdgeInsets.fromLTRB(16, 0, 0, 380),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 380),
                      child: Image.asset(
                        'images/tooth/9-lastest.png',
                        scale: 34,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth10Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.040,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.040,
                    //   margin: EdgeInsets.fromLTRB(59, 0, 0, 369),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(59, 0, 0, 369),
                      child: Image.asset(
                        'images/tooth/10-lastest.png',
                        scale: 34,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth11Detail(context)));
                  },
                  child: Center(
                    child: Container(
                      // width: MediaQuery.of(context).size.width *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.040,
                      // height: MediaQuery.of(context).size.height *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.040,
                      // margin: EdgeInsets.fromLTRB(90, 0, 0, 337),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(90, 0, 0, 337),
                        child: Image.asset(
                          'images/tooth/11-lastest.png',
                          scale: 34,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth12Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.044,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.044,
                    //   margin: EdgeInsets.fromLTRB(117, 0, 0, 300),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(117, 0, 0, 300),
                      child: Image.asset(
                        'images/tooth/12-lastest.png',
                        scale: 31,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth13Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.046,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.046,
                    //   margin: EdgeInsets.fromLTRB(146, 0, 0, 254),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(146, 0, 0, 254),
                      child: Image.asset(
                        'images/tooth/13-lastest.png',
                        scale: 29,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth14Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.047,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.047,
                    //   margin: EdgeInsets.fromLTRB(163, 0, 0, 204),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(163, 0, 0, 204),
                      child: Image.asset(
                        'images/tooth/14-lastest.png',
                        scale: 28,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth15Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.048,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.048,
                    //   margin: EdgeInsets.fromLTRB(174, 0, 0, 146),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(174, 0, 0, 146),
                      child: Image.asset(
                        'images/tooth/15-lastest.png',
                        scale: 27,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth16Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.052,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.052,
                    //   margin: EdgeInsets.fromLTRB(175, 0, 0, 81),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(175, 0, 0, 81),
                      child: Image.asset(
                        'images/tooth/16-lastest.png',
                        scale: 25,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth17Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.052,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.052,
                    //   margin: EdgeInsets.fromLTRB(187, 90, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(187, 90, 0, 0),
                      child: Image.asset(
                        'images/tooth/17-lastest.png',
                        scale: 25,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth18Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.049,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.049,
                    //   margin: EdgeInsets.fromLTRB(183, 164, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(183, 164, 0, 0),
                      child: Image.asset(
                        'images/tooth/18-lastest.png',
                        scale: 26,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth19Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.046,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.046,
                    //   margin: EdgeInsets.fromLTRB(173, 228, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(173, 228, 0, 0),
                      child: Image.asset(
                        'images/tooth/19-lastest.png',
                        scale: 29,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth20Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.044,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.044,
                    //   margin: EdgeInsets.fromLTRB(154, 285, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(154, 285, 0, 0),
                      child: Image.asset(
                        'images/tooth/20-lastest.png',
                        scale: 31,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth21Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    // width: MediaQuery.of(context).size.width *
                    //     MediaQuery.of(context).devicePixelRatio *
                    //     0.041,
                    // height: MediaQuery.of(context).size.height *
                    //     MediaQuery.of(context).devicePixelRatio *
                    //     0.041,
                    // margin: EdgeInsets.fromLTRB(123, 331, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(123, 331, 0, 0),
                      child: Image.asset(
                        'images/tooth/21-lastest.png',
                        scale: 33,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth22Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.037,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.037,
                    //   margin: EdgeInsets.fromLTRB(91, 359, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(91, 359, 0, 0),
                      child: Image.asset(
                        'images/tooth/22-lastest.png',
                        scale: 39,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth23Detail(context)));
                  },
                  child: Center(
                    // child: Container(
                    //   width: MediaQuery.of(context).size.width *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.037,
                    //   height: MediaQuery.of(context).size.height *
                    //       MediaQuery.of(context).devicePixelRatio *
                    //       0.037,
                    //   margin: EdgeInsets.fromLTRB(91, 359, 0, 0),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(58, 381, 0, 0),
                      child: Image.asset(
                        'images/tooth/23-lastest.png',
                        scale: 39,
                      ),
                    ),
                    // ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth24Detail(context)));
                  },
                  child: Center(
                    child: Container(
                      // width: MediaQuery.of(context).size.width *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // height: MediaQuery.of(context).size.height *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // margin: EdgeInsets.fromLTRB(16, 390, 00, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 390, 00, 0),
                        child: Image.asset(
                          'images/tooth/24-lastest.png',
                          scale: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth25Detail(context)));
                  },
                  child: Center(
                    child: Container(
                      // width: MediaQuery.of(context).size.width *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // height: MediaQuery.of(context).size.height *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // margin: EdgeInsets.fromLTRB(16, 390, 0, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 392, 34, 0),
                        child: Image.asset(
                          'images/tooth/25-lastest.png',
                          scale: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth26Detail(context)));
                  },
                  child: Center(
                    child: Container(
                      // width: MediaQuery.of(context).size.width *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // height: MediaQuery.of(context).size.height *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // margin: EdgeInsets.fromLTRB(16, 390, 00, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 382, 77, 0),
                        child: Image.asset(
                          'images/tooth/26-lastest.png',
                          scale: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth27Detail(context)));
                  },
                  child: Center(
                    child: Container(
                      // width: MediaQuery.of(context).size.width *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // height: MediaQuery.of(context).size.height *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // margin: EdgeInsets.fromLTRB(16, 390, 00, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 355, 107, 0),
                        child: Image.asset(
                          'images/tooth/27-lastest.png',
                          scale: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth28Detail(context)));
                  },
                  child: Center(
                    child: Container(
                      // width: MediaQuery.of(context).size.width *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // height: MediaQuery.of(context).size.height *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // margin: EdgeInsets.fromLTRB(16, 390, 00, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 323, 140, 0),
                        child: Image.asset(
                          'images/tooth/28-lastest.png',
                          scale: 33,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth29Detail(context)));
                  },
                  child: Center(
                    child: Container(
                      // width: MediaQuery.of(context).size.width *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // height: MediaQuery.of(context).size.height *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // margin: EdgeInsets.fromLTRB(16, 390, 00, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 270, 167, 0),
                        child: Image.asset(
                          'images/tooth/29-lastest.png',
                          scale: 31,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth30Detail(context)));
                  },
                  child: Center(
                    child: Container(
                      // width: MediaQuery.of(context).size.width *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // height: MediaQuery.of(context).size.height *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // margin: EdgeInsets.fromLTRB(16, 390, 00, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 215, 183, 0),
                        child: Image.asset(
                          'images/tooth/30-lastest.png',
                          scale: 29,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth31Detail(context)));
                  },
                  child: Center(
                    child: Container(
                      // width: MediaQuery.of(context).size.width *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // height: MediaQuery.of(context).size.height *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // margin: EdgeInsets.fromLTRB(16, 390, 00, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 155, 193, 0),
                        child: Image.asset(
                          'images/tooth/31-lastest.png',
                          scale: 27,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth32Detail(context)));
                  },
                  child: Center(
                    child: Container(
                      // width: MediaQuery.of(context).size.width *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // height: MediaQuery.of(context).size.height *
                      //     MediaQuery.of(context).devicePixelRatio *
                      //     0.036,
                      // margin: EdgeInsets.fromLTRB(16, 390, 00, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 85, 190, 0),
                        child: Image.asset(
                          'images/tooth/32-lastest.png',
                          scale: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
