import 'package:flutter/material.dart';
import 'package:fundee/dentalRecord.dart';

class DetailDental extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dental Charting')),
      body: Center(
        child: Text("ไว้ก่อนครับ กำลังจะทำ XD"),
      ),
    );
  }
}


Widget tooth1Detail(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Tooth1 Detail')),
    body: Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
            child: IconButton(
              icon: Image.asset('images/tooth/detail/1-1.png'), 
              onPressed: null)
          ),
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.fromLTRB(0, 75, 0, 0),
            child: IconButton(
              icon: Image.asset('images/tooth/detail/1-2.png'), 
              onPressed: null)
          ),
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: IconButton(
              icon: Image.asset('images/tooth/detail/1-3.png'), 
              onPressed: null)
          )
        ],
          
    )
  ));
}

Widget tooth2Detail(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Tooth1 Detail')),
    body: Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
            child: IconButton(
              icon: Image.asset('images/tooth/detail/2-1.png'), 
              onPressed: null)
          ),
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.fromLTRB(0, 75, 0, 0),
            child: IconButton(
              icon: Image.asset('images/tooth/detail/2-2.png'), 
              onPressed: null)
          ),
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: IconButton(
              icon: Image.asset('images/tooth/detail/2-3.png'), 
              onPressed: null)
          )
        ],
          
    )
  ));
}

Widget tooth3Detail(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('Tooth1 Detail')),
    body: Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 250),
            child: IconButton(
              icon: Image.asset('images/tooth/detail/3-1.png'), 
              onPressed: null)
          ),
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.fromLTRB(0, 75, 0, 0),
            child: IconButton(
              icon: Image.asset('images/tooth/detail/3-2.png'), 
              onPressed: null)
          ),
          Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: IconButton(
              icon: Image.asset('images/tooth/detail/3-3.png'), 
              onPressed: null)
          )
        ],
          
    )
  ));
}
