import 'package:flutter/material.dart';

class DetailHistoryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Card(
            child: Container(
              height: 50,
              child: Row(
                children: <Widget>[
                  Text(
                    'Case',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Date',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Status: ',
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
