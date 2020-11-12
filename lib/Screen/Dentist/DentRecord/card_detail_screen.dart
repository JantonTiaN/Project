import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';

class CardDetailScreen extends StatefulWidget {
  // final FirebaseUser user;
  // CardDetailScreen(this.user, {Key key}) : super(key: key);
  @override
  _CardDetailScreenState createState() => _CardDetailScreenState();
}

class _CardDetailScreenState extends State<CardDetailScreen> {
  @override
  void initState() {
    super.initState();
    getClinic();
  }

  List tooth1FrontCases, tooth1FrontDate, tooth1FrontDentist;
  int countOfCases;

  @override
  Widget build(BuildContext context) {
    Firestore firestore = Firestore.instance;
    DocumentReference documentReference = firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(clinic)
        .document(clinic)
        .collection('Patients')
        .document(uid)
        .collection('DentalCase')
        .document('dentalCase');
    documentReference.get().then((value) {
      if (value.data['tooth 1 Front'] != null) {
        countOfCases = value.data['tooth 1 Front'].length;
        for (var i = 0; i < countOfCases; i++) {
          tooth1FrontCases.addAll(value.data['tooth 1 Front'][i]['Case']);
          tooth1FrontDate.addAll(value.data['tooth 1 Front'][i]['Date']);
          tooth1FrontDentist.addAll(value.data['tooth 1 Front'][i]['Dentist']);
        }
      }
      if (value.data['tooth 1 Middle'] != null) {
        countOfCases += value.data['tooth 1 Middle'].length;
        for (var i = 0; i < value.data['tooth 1 Middle'].length; i++) {}
      }
      if (value.data['tooth 1 Back'] != null) {
        countOfCases += value.data['tooth 1 Back'].length;
        for (var i = 0; i < value.data['tooth 1 Back'].length; i++) {}
      }
    });
    return Scaffold(
        appBar: AppBar(
          title: Text('Case Detail'),
          backgroundColor: Colors.blue[300],
        ),
        body: Slidable(
          //   key: _key,
          //   dismissal: SlidableDismissal(
          //     child: SlidableDrawerDismissal(),
          //     onWillDismiss: (actionType) {
          //       return showDialog<bool>(
          //         context: context,
          //         builder: (context) {
          //           return AlertDialog(
          //             title: Text('Delete'),
          //             content: Text('Item will be deleted'),
          //             actions: <Widget>[
          //               FlatButton(
          //                 child: Text('Cancel'),
          //                 onPressed: () => Navigator.of(context).pop(false),
          //               ),
          //               FlatButton(
          //                 child: Text('Ok'),
          //                 onPressed: () => Navigator.of(context).pop(true),
          //               ),
          //             ],
          //           );
          //         },
          //       );
          //     },
          //   ),
          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          child: Container(
            color: Colors.white,
            child: Card(
              child: Row(
                children: [
                  Text(
                    'Front',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Case Name: '),
                        Text('Date: '),
                        Text('Dentist: ')
                      ],
                    ),
                  )
                  // Text('Front: Case name'
                  //     '\nDate: 01/11/63'
                  //     '\nDentist name'),
                ],
              ),
            ),
            // child: ListTile(
            //   title: Text('Front: Case name'),
            //   subtitle: Text('Date: 01/11/63'),
            //   isThreeLine: true,
            // ),
          ),
          actions: <Widget>[
            IconSlideAction(
              caption: 'Done',
              color: Colors.green,
              icon: Icons.check,
              // onTap: () => _showSnackBar('Saved'),
            ),
          ],
          secondaryActions: <Widget>[
            IconSlideAction(
              caption: 'Delete',
              color: Colors.red,
              icon: Icons.delete,
              // onTap: () => _showSnackBar('Delete'),
            ),
          ],
        ));
  }
}

String uid;
void patientUid(String patientUid) {
  uid = patientUid;
}
