import 'package:flutter/material.dart';

class ChangeTextColorPopupMenu extends StatefulWidget {
  @override
  ChangeTextColorPopupMenuState createState() {
    return new ChangeTextColorPopupMenuState();
  }
}

class ChangeTextColorPopupMenuState extends State<ChangeTextColorPopupMenu> {
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.teal,
    Colors.brown,
    Colors.pink
  ];

  int _currentIndex = 1;

  _onChanged() {
    //update with a new color when the user taps button
    int _colorCount = _colors.length;

    setState(() {
      if (_currentIndex == _colorCount - 1) {
        _currentIndex = 0;
      } else {
        _currentIndex += 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Change PopupMenuButton Text color Example"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    PopupMenuButton(
                      child: Text("View Account",
                          style: TextStyle(color: _colors[_currentIndex])),
                      itemBuilder: (context) => [
                            PopupMenuItem(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.person),
                                  SizedBox(width: 10.0),
                                  Text("Account",
                                      style: TextStyle(
                                          color: _colors[_currentIndex])),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.lock),
                                  SizedBox(width: 10.0),
                                  Text("Change Password",
                                      style: TextStyle(
                                          color: _colors[_currentIndex])),
                                ],
                              ),
                            ),
                            PopupMenuItem(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.exit_to_app),
                                  SizedBox(width: 10.0),
                                  Text("Sign Out",
                                      style: TextStyle(
                                          color: _colors[_currentIndex])),
                                ],
                              ),
                            ),
                          ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: RaisedButton(
                  onPressed: _onChanged,
                  child: Text("Change Color"),
                  color: Colors.red,
                ),
              ),
            )
          ],
        ));
  }
}