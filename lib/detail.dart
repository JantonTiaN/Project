import 'package:flutter/material.dart';

class DetailDental extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dental Charting')),
      body: Center(
        child: Column(
          children: <Widget>[tooth1(), tooth2(), tooth3()],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: Container(
          color: Colors.blue,
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              
            },
            child: Icon(Icons.add,color: Colors.blue,),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

Widget tooth1() {
  return Container(
      width: 200,
      height: 200,
      child: Image.asset("assets/images/tooth1-1.png"));
}

Widget tooth2() {
  return Container(
      width: 150,
      height: 150,
      child: Image.asset("assets/images/tooth1-2.png"));
}

Widget tooth3() {
  return Container(
      width: 200,
      height: 200,
      child: Image.asset("assets/images/tooth1-3.png"));
}
