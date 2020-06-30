import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Wrap(
                      children: <Widget>[
                        ListTile(
                          title: Center(child: Text("Hobbies")),
                          subtitle: Center(child: Text("Select your hobbie"),),
                        ),
                        ListTile(
                          title: Text("Coding"),
                          leading: Icon(Icons.code),
                        ),
                        ListTile(
                          title: Text("Main Game"),
                          leading: Icon(Icons.games),
                        ),
                        ListTile(
                          title: Text("Menulis"),
                          leading: Icon(Icons.text_format),
                        ),
                      ],
                    );
                  });
            },
            child: Text("Tap me"),
          ),
        ),
      ),
    );
  }
}