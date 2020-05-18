import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Services/logger_service.dart';
import 'package:fundee/components/show_notification.dart';

Future<void> addPatient(
    BuildContext context, Map<String, dynamic> data, String documentName) {
  return Firestore.instance
      .collection('Account')
      .document('account')
      .collection('Users')
      .document('user999')
      .setData(data, merge: true)
      .then((returnData) {
    showMessageBox(
        context, "Success", "Added patient $documentName to Firestore",
        actions: [dismissButton(context)]);
    logger.i("setData success");
  }).catchError((e) {
    logger.e(e);
  });
}
