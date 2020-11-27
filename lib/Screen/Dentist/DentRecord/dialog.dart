import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Dentist/DentRecord/dental_detail1_screen.dart';
import 'package:rich_alert/rich_alert.dart';

successAddDialog1(BuildContext context) async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  showDialog<String>(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => DentalDetailScreen(user)
                      .createState()
                      .tooth1Detail(context)));
          // Navigator.pop(context);
        });
        return RichAlertDialog(
          //uses the custom alert dialog
          alertTitle: richTitle("Saved"),
          alertSubtitle: richSubtitle(""),
          alertType: RichAlertType.SUCCESS,
          blurValue: 5.0,
          actions: [FlatButton(onPressed: null, child: null)],
        );
      });
}

successDeleteDialog1(BuildContext context) async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();
  showDialog<String>(
      context: context,
      builder: (context) {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pop(context);
          // Navigator.pushReplacement(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => DentalDetailScreen(user)
          //             .createState()
          //             .tooth1Detail(context)));
        });
        return RichAlertDialog(
          //uses the custom alert dialog
          alertTitle: richTitle("Saved"),
          alertSubtitle: richSubtitle(""),
          alertType: RichAlertType.SUCCESS,
          blurValue: 5.0,
          actions: [FlatButton(onPressed: null, child: null)],
        );
      });
}
