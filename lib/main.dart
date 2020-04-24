import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:fundee/fund.dart';

void main(List<String> args) {
  runApp(MyApp());
=======
import 'package:fundee/home.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
    @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Home());
  }
>>>>>>> 6871eee9c71d78d61d80f80a519405a1241c7f5a
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FunD(),
    );
  }
}