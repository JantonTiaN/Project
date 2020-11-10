import 'package:flutter/material.dart';

class SuggestionDetailScreen extends StatefulWidget {
  final String suggestion;
  SuggestionDetailScreen({Key key, @required this.suggestion})
      : super(key: key);
  @override
  _SuggestionDetailScreenState createState() => _SuggestionDetailScreenState();
}

class _SuggestionDetailScreenState extends State<SuggestionDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestion Detail'),
        backgroundColor: Colors.blue[300],
      ),
      body: Column(
        children: [Text(widget.suggestion)],
      ),
    );
  }
}
