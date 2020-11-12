import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuggestionDialog extends StatefulWidget {
  @override
  _SuggestionDialogState createState() => _SuggestionDialogState();
}

class _SuggestionDialogState extends State<SuggestionDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CupertinoAlertDialog(
      title: Text('Type Suggestion'),
      content: TextField(),
    ));
  }
}
