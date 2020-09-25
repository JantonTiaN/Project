import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fundee/Screen/Dentist/dentist_profile_screen.dart';
import 'package:fundee/Screen/constants.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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
  final _picker = ImagePicker();
  final _nameController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final displayNameController = TextEditingController();
  String name, eMail, tel, urlPicture;
  @override
  void initState() {
    super.initState();
    // _nameController.text = widget.user.displayName.toString();
  }

  Future<void> uploadPic(String _name, String _email, String _url) async {
    String pic = widget.user.uid;
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    StorageReference storageReference =
        firebaseStorage.ref().child('dentistProfile/$pic.jpg');
    StorageUploadTask storageUploadTask = storageReference.putFile(_image);
    urlPicture =
        await (await storageUploadTask.onComplete).ref.getDownloadURL();
    print('urlPicture = $urlPicture');
    updateDataToFirestore(_name, _email, _url);
  }

  Future<void> updateDataToFirestore(
      String _name, String _email, String _url) async {
    FirebaseUser user = await _auth.currentUser();
    Firestore firestore = Firestore.instance;
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    DocumentReference documentReference = firestore
        .collection('Account')
        .document('account')
        .collection('Dentists')
        .document(widget.user.uid);
    Map<String, dynamic> map = Map();
    if (_name != null) {
      map['fullName'] = _name;
    } else {
      map['fullName'] = widget.user.displayName;
    }
    if (_email != null) {
      map['eMail'] = _email;
    } else {
      map['eMail'] = widget.user.email;
    }
    if (urlPicture != null) {
      map['pathImage'] = urlPicture;
    }
    userUpdateInfo.displayName = _name;
    userUpdateInfo.photoUrl = urlPicture;
    user.updateProfile(userUpdateInfo);
    // await user.reload();
    // print('Before');
    // print(user.isEmailVerified);
    // user = await _auth.currentUser();
    // user.isEmailVerified;
    // print('After');
    // print(user.isEmailVerified);
    // print(user.photoUrl);
    // print(user.displayName);
    documentReference.updateData(map).then((value) {
      print('Update Success');
      MaterialPageRoute(builder: (value) => DentProfileScreen(widget.user));
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

    Future _pickImageFromCamera() async {
      final PickedFile pickedFile =
          await _picker.getImage(source: ImageSource.camera);
      setState(() {
        this._image = File(pickedFile.path);
      });
    }

    Future<void> showAlert(String title, String message) async {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text(title),
                content: Text(message),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('ok'),
                  )
                ]);
          });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              child: Stack(
                children: <Widget>[
                  Container(),
                  ClipPath(
                    clipper: MyCustomClipper(),
                  ),
                  Align(
                    alignment: Alignment(0, 1),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 65,
                          // backgroundColor: Colors.white,
                          child: ClipOval(
                            child: new SizedBox(
                                width: 120.0,
                                height: 120.0,
                                child: (_image != null)
                                    ? Image.file(
                                        _image,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        widget.user.photoUrl,
                                        fit: BoxFit.fill,
                                      )),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        // bool sa
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: const Text('Change Profile Photo'),
                            children: <Widget>[
                              Divider(
                                color: Colors.grey[300],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: SimpleDialogOption(
                                  onPressed: () {
                                    getImage();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Import From Gallery'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: SimpleDialogOption(
                                  onPressed: () {
                                    _pickImageFromCamera();
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Take Photo'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: SimpleDialogOption(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    UserUpdateInfo userUpdateInfo =
                                        new UserUpdateInfo();
                                    userUpdateInfo.photoUrl =
                                        'https://firebasestorage.googleapis.com/v0/b/fun-d-d3f33.appspot.com/o/App-Icon-drop-shadow.jpg?alt=media&token=b4e55348-6a2c-47f4-9eec-2a4f4f380208';
                                    widget.user.updateProfile(userUpdateInfo);
                                    Firestore.instance
                                        .collection('Account')
                                        .document('account')
                                        .collection('Dentists')
                                        .document(widget.user.uid)
                                        .updateData({
                                      'pathImage':
                                          'https://firebasestorage.googleapis.com/v0/b/fun-d-d3f33.appspot.com/o/App-Icon-drop-shadow.jpg?alt=media&token=b4e55348-6a2c-47f4-9eec-2a4f4f380208',
                                    });
                                  },
                                  child: const Text('Remove Profile Photo'),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 250),
                      child: Center(
                        child: Text(
                          'Change Profile Photo',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.fromLTRB(210, 210, 0, 0),
                    //   child: Container(
                    //     width: 30,
                    //     height: 30,
                    //     decoration: BoxDecoration(
                    //       color: Colors.amber[400],
                    //       shape: BoxShape.circle,
                    //     ),
                    //     child: Icon(
                    //       LineAwesomeIcons.pen,
                    //       color: Colors.black,
                    //       size: 20,
                    //     ),
                    //   ),
                    // ),
                  ),
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                          ),
                        ),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                            uploadPic(name, eMail, urlPicture);
                          },
                          icon: Icon(
                            Icons.check,
                          ),
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: TextFormField(
                onChanged: (value) {
                  name = value.trim();
                },
                decoration: new InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
                controller: displayNameController,
              ),
            ),
            Divider(
              color: Colors.blueGrey[100],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Profile Information',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  eMail = value.trim();
                },
                decoration: InputDecoration(
                  labelText: 'E-Mail',
                  labelStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 100);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
