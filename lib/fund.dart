// import 'dart:html';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fundee/detail.dart';

class FunD extends StatelessWidget {
  Widget dentalChart() {
    return Container(
      width: 400.0,
      height: 400.0,
      child: Image.asset('assets/images/DentalChart(Adult).png'),
    );
  }

  Widget build(BuildContext context) {
    var scaffold = Scaffold(
        appBar: AppBar(
          title: Text('FunD'),
        ),
        body: Container(
          child: Center(
            child: dentalChart()
          )
        ),
        floatingActionButton: Container(
          width: 40,
          height: 40,
          child: Align(
              alignment: Alignment(-1.00, 0.05),
              child: FloatingActionButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailDental())),
                child: Text('+'),
                backgroundColor: Colors.green,
              )),
        ));
    return scaffold;
  }
}


