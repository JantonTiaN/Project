import 'package:flutter/material.dart';
import 'package:fundee/patientList.dart';

class DetailDental extends StatefulWidget {
  @override
  _DetailDentalState createState() => _DetailDentalState();
}

class _DetailDentalState extends State<DetailDental> {
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

class Icontooth {}

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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
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
                                  builder: (context) => DetailDental()));
                        }),
                  )
                ],
              ))));
}
