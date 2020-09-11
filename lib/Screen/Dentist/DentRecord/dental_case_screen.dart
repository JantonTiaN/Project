import 'package:flutter/material.dart';
import 'package:fundee/States/current_user.dart';
import 'package:provider/provider.dart';

class DentalCaseScreen extends StatefulWidget {
  @override
  _dentalCase3MiddleScreenState createState() =>
      _dentalCase3MiddleScreenState();
}

class _dentalCase3MiddleScreenState extends State<DentalCaseScreen> {
  var _case = new List();

  List _dentalCase3Middle() {
    var dentalCase = _case;
    return dentalCase;
  }

  void _addDentalCase3Middle(BuildContext context, List addCase) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    try {
      String _returnString =
          await _currentUser.addDentalCase10Back(_dentalCase3Middle, '');
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
                _case.add('Dental Carise');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Attrition');
                _case.add('Attrition');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Fractured tooth');
                _case.add('Fractured tooth');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('retained root');
                _case.add('Retained root');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('RCT tooth');
                _case.add('RCT tooth');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Extracted tooth');
                _case.add('Extracted tooth');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Missing tooth');
                _case.add('Missing tooth');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Impacted tooth');
                _case.add('Impacted tooth');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Partial eruption');
                _case.add('Partial eruption');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Tilting');
                _case.add('Tilting');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Loss of contact');
                _case.add('Loss of contact');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Poor contact point');
                _case.add('Poor contact point');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Food impaction');
                _case.add('Food impaction');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Supraclusion');
                _case.add('Supraclusion');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Infraclusion');
                _case.add('Infraclusion');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add("Rotation");
                _case.add('Rotation');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Temporary');
                _case.add('Temporary');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Permanentrestoration');
                _case.add('Permanentrestoration');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Gold restoration');
                _case.add('Gold restoration');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Porcelain');
                _case.add('Porcelain');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
                // _dentalCase3Middle().add('Extract');
                _case.add('Extract');
                _addDentalCase3Middle(context, _dentalCase3Middle());
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
