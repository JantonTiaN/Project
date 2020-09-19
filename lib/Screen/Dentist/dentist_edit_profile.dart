import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fundee/widget/stack_container.dart';
import 'package:fundee/widget/top_bar_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DentEditProfile extends StatefulWidget {
  final FirebaseUser user;
  DentEditProfile(this.user, {Key key}) : super(key: key);
  @override
  _DentEditProfileState createState() => _DentEditProfileState();
}

class _DentEditProfileState extends State<DentEditProfile> {
  File _image;
  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    // Future uploadPic(BuildContext context) async {
    //   String fileName = basename(_image.path);
    //   StorageReference firebaseStorageRef =
    //       FirebaseStorage.instance.ref().child(fileName);
    //   StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    //   StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    //   setState(() {
    //     print("Profile Picture uploaded");
    //     Scaffold.of(context)
    //         .showSnackBar(SnackBar(content: Text('Profile Picture Uploaded')));
    //   });
    // }

    return Scaffold(
      body: Column(
        children: <Widget>[
          StackContainer(widget.user),
          Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Colors.amber[400],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    LineAwesomeIcons.pen,
                    size: 25,
                  ),
                  // color: Colors.black,
                ),
              ),
            ],
          ),
          TopBarWidget(),
        ],
      ),
    );
  }
}
