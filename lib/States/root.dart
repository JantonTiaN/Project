import 'package:flutter/material.dart';
import 'package:fundee/Screen/signin_screen.dart';
import 'package:fundee/Screen/welcome_screen.dart';
import 'package:fundee/States/current_user.dart';
import 'package:fundee/home.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  notloggedIn,
  loggedIn,
}

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notloggedIn;

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    //get the state, check currentUser, set AuthStatus base on state
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _returnString = await _currentUser.onStartUp();
    if (_returnString == 'success') {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget returnVal;

    switch (_authStatus) {
      case AuthStatus.notloggedIn:
        returnVal = WelcomeScreen();
        break;
      case AuthStatus.loggedIn:
        returnVal = Home();
        break;
      default:
    }
    return returnVal;
  }
}
