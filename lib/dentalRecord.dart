import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fundee/detail.dart';
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
    CollectionReference collectionReference = firestore.collection('Account').document('account').collection('Users');
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
    return 
        Container(
          padding: EdgeInsets.all(0.3),
          color: Colors.grey[300],
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.05,
            child: ListView.builder(
                itemCount: userModels.length,
                itemBuilder: (BuildContext buildContext, int index) {
                  return Container(
                    child: Container(
                      child: Text(' ' + userModels[index].firstName + ' ' +userModels[index].lastName, style: TextStyle(fontSize: 15, color: Colors.black))
                      )
                    );
                }
      ));
      
    
  }
}

class DentalRecord extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dental Charting')),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                child: Tooth1(),
              ),
              Container(
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text('Upper'), Text('Lower')],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width *
                    MediaQuery.of(context).devicePixelRatio,
                height: MediaQuery.of(context).size.height *
                    MediaQuery.of(context).devicePixelRatio,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[Text('Right'), Text('Left')],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio,
                  margin: EdgeInsets.fromLTRB(63, 0, 65, 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[Text('1'), Text('16')],
                  )),
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
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.84,
                  height: MediaQuery.of(context).size.height * 0.84,
                  child: Image.asset('images/tooth/AllGum.png'),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.052,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.052,
                  margin: EdgeInsets.fromLTRB(0, 0, 190, 70),
                  child: IconButton(
                      icon: Image.asset('images/tooth/1-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth1Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.048,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.048,
                  margin: EdgeInsets.fromLTRB(0, 0, 190, 134),
                  child: IconButton(
                      icon: Image.asset('images/tooth/2-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth2Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.047,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.047,
                  margin: EdgeInsets.fromLTRB(0, 0, 180, 191),
                  child: IconButton(
                      icon: Image.asset('images/tooth/3-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth3Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.046,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.046,
                  margin: EdgeInsets.fromLTRB(0, 0, 163, 238),
                  child: IconButton(
                      icon: Image.asset('images/tooth/4-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth4Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.044,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.044,
                  margin: EdgeInsets.fromLTRB(0, 0, 136, 285),
                  child: IconButton(
                      icon: Image.asset('images/tooth/5-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth5Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.039,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.039,
                  margin: EdgeInsets.fromLTRB(0, 0, 110, 325),
                  child: IconButton(
                      icon: Image.asset('images/tooth/6-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth6Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.039,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.039,
                  margin: EdgeInsets.fromLTRB(0, 0, 81, 357),
                  child: IconButton(
                      icon: Image.asset('images/tooth/7-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth7Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.039,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.039,
                  margin: EdgeInsets.fromLTRB(0, 0, 39, 372),
                  child: IconButton(
                      icon: Image.asset('images/tooth/8-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth8Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.039,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.039,
                  margin: EdgeInsets.fromLTRB(9, 0, 0, 374),
                  child: IconButton(
                      icon: Image.asset('images/tooth/9-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth9Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.039,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.039,
                  margin: EdgeInsets.fromLTRB(53, 0, 0, 365),
                  child: IconButton(
                      icon: Image.asset('images/tooth/10-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth10Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.039,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.039,
                  margin: EdgeInsets.fromLTRB(86, 0, 0, 335),
                  child: IconButton(
                      icon: Image.asset('images/tooth/11-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth11Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.044,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.044,
                  margin: EdgeInsets.fromLTRB(115, 0, 0, 300),
                  child: IconButton(
                      icon: Image.asset('images/tooth/12-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth12Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.046,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.046,
                  margin: EdgeInsets.fromLTRB(143, 0, 0, 253),
                  child: IconButton(
                      icon: Image.asset('images/tooth/13-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth13Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.046,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.046,
                  margin: EdgeInsets.fromLTRB(161, 0, 0, 203),
                  child: IconButton(
                      icon: Image.asset('images/tooth/14-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth14Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.05,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.05,
                  margin: EdgeInsets.fromLTRB(172, 0, 0, 144),
                  child: IconButton(
                      icon: Image.asset('images/tooth/15-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth15Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.052,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.052,
                  margin: EdgeInsets.fromLTRB(171, 0, 0, 77),
                  child: IconButton(
                      icon: Image.asset('images/tooth/16-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth16Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.052,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.052,
                  margin: EdgeInsets.fromLTRB(180, 90, 0, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/17-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth17Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.049,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.049,
                  margin: EdgeInsets.fromLTRB(180, 164, 00, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/18-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth18Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.046,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.046,
                  margin: EdgeInsets.fromLTRB(170, 228, 00, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/19-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth19Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.044,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.044,
                  margin: EdgeInsets.fromLTRB(152, 284, 00, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/20-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth20Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.041,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.041,
                  margin: EdgeInsets.fromLTRB(121, 330, 00, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/21-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth21Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.037,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.037,
                  margin: EdgeInsets.fromLTRB(91, 359, 00, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/22-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth22Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.037,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.037,
                  margin: EdgeInsets.fromLTRB(59, 380, 00, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/23-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth23Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.036,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.036,
                  margin: EdgeInsets.fromLTRB(16, 390, 00, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/24-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth24Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.036,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.036,
                  margin: EdgeInsets.fromLTRB(0, 392, 27, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/25-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth25Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.036,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.036,
                  margin: EdgeInsets.fromLTRB(0, 383, 69, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/26-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth26Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.036,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.036,
                  margin: EdgeInsets.fromLTRB(0, 360, 98, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/27-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth27Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.042,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.042,
                  margin: EdgeInsets.fromLTRB(0, 330, 130, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/28-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth28Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.044,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.044,
                  margin: EdgeInsets.fromLTRB(0, 276, 160, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/29-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth29Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.046,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.046,
                  margin: EdgeInsets.fromLTRB(0, 220, 180, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/30-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth30Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.05,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.05,
                  margin: EdgeInsets.fromLTRB(0, 160, 191, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/31-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth31Detail(context)));
                      }),
                ),
              ),
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width *
                      MediaQuery.of(context).devicePixelRatio *
                      0.05,
                  height: MediaQuery.of(context).size.height *
                      MediaQuery.of(context).devicePixelRatio *
                      0.05,
                  margin: EdgeInsets.fromLTRB(0, 88, 190, 0),
                  child: IconButton(
                      icon: Image.asset('images/tooth/32-lastest.png'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => tooth32Detail(context)));
                      }),
                ),
              ),
            ],
          ),
        ));
  }
}
