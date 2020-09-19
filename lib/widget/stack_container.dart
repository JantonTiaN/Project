import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'top_bar_widget.dart';

class StackContainer extends StatelessWidget {
  final FirebaseUser user;
  StackContainer(this.user, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Stack(
        children: <Widget>[
          Container(),
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              height: 260,
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Colors.lightBlue[400],
                Colors.blue,
                Colors.indigo[300]
              ])),
            ),
          ),
          Align(
            alignment: Alignment(0, 1),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  radius: 65,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: new SizedBox(
                      width: 120.0,
                      height: 120.0,
                      child: Image.asset(
                        'assets/images/Logo/App-Icon-drop-shadow.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(user.displayName,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
                Text(
                  'admin@fund.com',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          TopBarWidget(),
          // GestureDetector(
          //   onTap: () {},
          //   child: Padding(
          //     padding: const EdgeInsets.fromLTRB(210, 210, 0, 0),
          //     child: Container(
          //       width: 30,
          //       height: 30,
          //       decoration: BoxDecoration(
          //         color: Colors.amber[400],
          //         shape: BoxShape.circle,
          //       ),
          //       child: Icon(
          //         LineAwesomeIcons.pen,
          //         color: Colors.black,
          //         size: 20,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
