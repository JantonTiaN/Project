import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dentalRecord.dart';
import 'package:fundee/States/current_user.dart';
import 'package:provider/provider.dart';

class DentalCaseScreen extends StatefulWidget {
  @override
  _DentalCaseScreenState createState() => _DentalCaseScreenState();
}

class _DentalCaseScreenState extends State<DentalCaseScreen> {
  var _case = new List();

  List _dentalCase() {
    var dentalCase = _case;
    return dentalCase;
  }

  void _addDentalCase(BuildContext context, List addCase) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString = await _currentUser.addDentalCase(_dentalCase);
      if (_returnString == 'success') {
        Navigator.pop(context, 'OK');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tooth Case"),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Dental Carise');
                _case.add('Dental Carise');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            "assets/images/Dentalcaries.png",
                            height: 75,
                            width: 75,
                          ),
                          Text(
                            "Dental Caries",
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Attrition');
                _case.add('Attrition');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Attrition",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Fractured tooth');
                _case.add('Fractured tooth');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Fractured tooth",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('retained root');
                _case.add('Retained root');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Retained root",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('RCT tooth');
                _case.add('RCT tooth');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "RCT tooth",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Extracted tooth');
                _case.add('Extracted tooth');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Extracted tooth",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Missing tooth');
                _case.add('Missing tooth');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Missing tooth",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Impacted tooth');
                _case.add('Impacted tooth');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Impacted tooth",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Partial eruption');
                _case.add('Partial eruption');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Partial eruption",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Tilting');
                _case.add('Tilting');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Tilting",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Loss of contact');
                _case.add('Loss of contact');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Loss of contact",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Poor contact point');
                _case.add('Poor contact point');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Poor contact point",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Food impaction');
                _case.add('Food impaction');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Food impaction",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Supraclusion');
                _case.add('Supraclusion');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Supraclusion",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Infraclusion');
                _case.add('Infraclusion');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Infraclusion",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add("Rotation");
                _case.add('Rotation');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Rotation",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Temporary');
                _case.add('Temporary');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Temporary",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Permanentrestoration');
                _case.add('Permanentrestoration');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Permanentrestoration",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Gold restoration');
                _case.add('Gold restoration');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Gold restoration",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Porcelain');
                _case.add('Porcelain');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Porcelain",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {
                // _dentalCase().add('Extract');
                _case.add('Extract');
                _addDentalCase(context, _dentalCase());
              },
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "Extract",
                        style: TextStyle(fontSize: 25),
                      ),
                    )),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Card(
                color: Colors.blue[100],
                elevation: 10,
                child: Container(
                    height: 100,
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Other Detail',
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
