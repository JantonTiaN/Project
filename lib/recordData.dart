import 'package:flutter/material.dart';
import 'package:fundee/buttonRecord.dart';

class RecordData extends StatefulWidget {
  final bool active;
  final Function onTap;

  const RecordData({Key key, this.active, this.onTap}) : super(key: key);
  @override
  _RecordDataState createState() => _RecordDataState();
}

class _RecordDataState extends State<RecordData> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 500),
      curve: Curves.decelerate,
      bottom: widget.active ? 5 : -600,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        height: MediaQuery.of(context).size.height * 0.70,
        width: MediaQuery.of(context).size.height * 0.95,
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            Container(
              height: 50,
              color: Colors.white70,
              child: Center(child: Text('Case1')),
              
            ),
            Container(
              height: 50,
              color: Colors.white70,
              child: Center(child: Text('Case2')),
            ),
            Container(
              height: 50,
              color: Colors.white70,
              child: Center(child: Text('Case3')),
            ),
            Container(
              height: 50,
              color: Colors.white70,
              child: Center(child: Text('Case4')),
            ),
            Container(
              height: 50,
              color: Colors.white70,
              child: Center(child: Text('Case5')),
            ),
            Container(
              height: 50,
              color: Colors.white70,
              child: Center(child: Text('Case6')),
            ),
            Container(
              height: 50,
              color: Colors.white70,
              child: Center(child: Text('Case7')),
            ),
            Container(
              height: 50,
              color: Colors.white70,
              child: Center(child: Text('Case8')),
            ),
            Container(
              height: 50,
              color: Colors.white70,
              child: Center(child: Text('Case9')),
            ),
            Container(
              height: 50,
              color: Colors.white70,
              child: Center(child: Text('Case10')),
            ),
            ButtonRecord(
              color: Colors.red[400],
              label: "Close",
              onTap: widget.onTap,
            )
            
          ],
        ),
        
      ),
    );
  }
}
