import 'package:flutter/material.dart';

class DentalCase extends StatelessWidget {
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
              onPressed: (){
                
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
                        Image.asset("assets/images/Dentalcaries.png",height: 75, width: 75,),
                        Text("Dental Caries", style: TextStyle(fontSize: 25),)
                      ],
                    ),
                  )),
            ),
            ),
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
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
            Card(
              color: Colors.blue[100],
              elevation: 10,
              child: Container(
                  height: 100,
                  child: Center(
                    child: Text(
                      "extract",
                      style: TextStyle(fontSize: 25),
                    ),
                  )),
            ),
            Card(
              color: Colors.blue[100],
              elevation: 10,
              child: Container(
                  height: 100,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Other Detail',),
                  )),
            ),
          ],
        ),
      ),
      
    );
  }
}