import 'package:flutter/material.dart';

class DetailDental extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dental Charting')),
      body: Container(
        child: tooth(),
      ),
    );
  }
}

Widget tooth() {
  return Container(
      child: Center(
        child: Image.asset('assets/images/tooth.png'),
      ));
}
