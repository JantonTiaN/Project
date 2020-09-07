import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fundee/States/current_user.dart';
import 'package:provider/provider.dart';
import 'dental_detail_screen.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail_screen.dart';

// class Tooth1 extends StatefulWidget {
//   @override
//   _Tooth1State createState() => _Tooth1State();
// }

// class _Tooth1State extends State<Tooth1> {
// List<UserModel> userModels = List();
// List<AccountModel> accountModels = List();

// @override
// void initState() {
//   super.initState();
//   readAllData();
// }

// Future<void> readAllData() async {
//   Firestore firestore = Firestore.instance;
//   CollectionReference collectionReference =
//       firestore.collection('Account').document('account').collection('Users');
//   collectionReference.snapshots().listen((response) {
//     List<DocumentSnapshot> snapshots = response.documents;
//     for (var snapshot in snapshots) {
//       UserModel userModel = UserModel.fromMap(snapshot.data);
//       setState(() {
//         userModels.add(userModel);
//       });
//     }
//   });
// }

// @override
// Widget build(BuildContext context) {
//   return Container(
//       padding: EdgeInsets.all(0.3),
//       // color: Colors.grey[300],
//       width: MediaQuery.of(context).size.width * 0.5,
//       height: MediaQuery.of(context).size.height * 0.03,
//       child: ListView.builder(
//           itemCount: userModels.length,
//           itemBuilder: (BuildContext buildContext, int index) {
//             return Container(
//                 child: Container(
//                     child: Text(
//                         ' ' +
//                             userModels[6].firstName +
//                             ' ' +
//                             userModels[6].lastName,
//                         style:
//                             TextStyle(fontSize: 15, color: Colors.black))));
//           }));
//   }
// }

class DentalRecord extends StatefulWidget {
  final String fullname;
  final String tel;
  DentalRecord({Key key, @required this.fullname, @required this.tel})
      : super(key: key);
  @override
  _DentalRecordState createState() => _DentalRecordState();
}

class _DentalRecordState extends State<DentalRecord> {
  // void getDocID(BuildContext context, String docID) async {
  //   CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
  //   try {
  //     String _returnString = await _currentUser.docID(tel);
  //     if (_returnString == 'seccess') {
  //       print('Already get Doc ID.');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void initState() {
    super.initState();
    Firestore.instance
        .collection("Account")
        .document('account')
        .collection('Patients')
        .document(widget.fullname)
        .get()
        .then((value) {
      // setState(() {
      //   pnumber = value.data['tel'];
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: bBackgroundColor,
        appBar: AppBar(
          title: Text(widget.fullname),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Stack(
              children: <Widget>[
                // Container(
                //   child: Tooth1(),
                // ),
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
                  padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                  child: Center(
                    child: Image.asset(
                      'images/tooth/AllGum-lastest.png',
                      scale: 4.3,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth1Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 243, 200, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/1-lastest.png',
                        scale: 25,
                      ),
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 211, 200, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/2-lastest.png',
                        scale: 27,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth3Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 180.5, 190, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/3-lastest.png',
                        scale: 28,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth4Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 155, 175, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/4-lastest.png',
                        scale: 29,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth5Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 131, 153, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/5-lastest.png',
                        scale: 31,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth6Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 111, 115, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/6-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth7Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 91, 80, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/7-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth8Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 84, 29, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/8-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth9Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(27.5, 84, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/9-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth10Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(78, 92, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/10-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth11Detail(context)));
                  },
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(113, 110, 0, 0),
                      child: Center(
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(143, 128.5, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/12-lastest.png',
                        scale: 31,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth13Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(172, 151.5, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/13-lastest.png',
                        scale: 29,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth14Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(185, 178, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/14-lastest.png',
                        scale: 28,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth15Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(197, 207.5, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/15-lastest.png',
                        scale: 27,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth16Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(198, 239.5, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/16-lastest.png',
                        scale: 25,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth17Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(203, 330, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/17-lastest.png',
                        scale: 25,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth18Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(203, 370, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/18-lastest.png',
                        scale: 26,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth19Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(191, 405, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/19-lastest.png',
                        scale: 29,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth20Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(171, 435, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/20-lastest.png',
                        scale: 31,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth21Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(140, 461, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/21-lastest.png',
                        scale: 33,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth22Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(104, 478, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/22-lastest.png',
                        scale: 39,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth23Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(74, 492, 0, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/23-lastest.png',
                        scale: 39,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => tooth24Detail(context)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(26, 498, 00, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/24-lastest.png',
                        scale: 40,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 498, 22, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/25-lastest.png',
                        scale: 40,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 493, 69, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/26-lastest.png',
                        scale: 40,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 480, 101, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/27-lastest.png',
                        scale: 40,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 460, 134, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/28-lastest.png',
                        scale: 33,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 431, 165, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/29-lastest.png',
                        scale: 31,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 400.5, 185, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/30-lastest.png',
                        scale: 29,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 369, 200, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/31-lastest.png',
                        scale: 27,
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 330, 200, 0),
                    child: Center(
                      child: Image.asset(
                        'images/tooth/32-lastest.png',
                        scale: 25,
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
