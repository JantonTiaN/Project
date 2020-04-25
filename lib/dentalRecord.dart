// import 'dart:html';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fundee/detail.dart';

class DentalRecord extends StatelessWidget {
  @override
  Widget dentalChart() {
    return Container(
      width: 400.0,
      height: 400.0,
      child: Image.asset('assets/images/DentalChart(Adult).png'),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Dental Charting')),
        body: Center(
          child: Stack(
            children: <Widget>[
              Container(
                width: 500,
                height: 500,
                child: Image.asset('assets/images/AllGum.png'),
              ),
              Container(
                width: 500,
                height: 500,
                child: IconButton(
                    icon: Image.asset('assets/images/1.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
              Container(
                width: 500,
                height: 500,
                child: IconButton(
                    icon: Image.asset('assets/images/2.png'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailDental()));
                    }),
              ),
            ],
          ),
        )
        );
        
  }
}

