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

  final displayNameController = TextEditingController();
  String name, eMail, tel, urlPicture;
  @override
  void initState() {
    super.initState();
    // _nameController.text = widget.user.displayName.toString();
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

    Future<void> uploadPic() async {
      String pic = widget.user.email;
      FirebaseStorage firebaseStorage = FirebaseStorage.instance;
      StorageReference storageReference =
          firebaseStorage.ref().child('dentistProfile/$pic.jpg');
      StorageUploadTask storageUploadTask = storageReference.putFile(_image);
      urlPicture =
          await (await storageUploadTask.onComplete).ref.getDownloadURL();
      print('urlPicture = $urlPicture');
    }

    Future<void> updateDataToFirestore() async {
      Firestore firestore = Firestore.instance;
      UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
      DocumentReference documentReference = firestore
          .collection('Account')
          .document('account')
          .collection('Dentists')
          .document(widget.user.email);
      Map<String, dynamic> map = Map();
      map['fullName'] = name;
      map['eMail'] = eMail;
      map['tel'] = tel;
      map['pathImage'] = urlPicture;
      widget.user.updateEmail(eMail);
      userUpdateInfo.displayName = name;
      documentReference.updateData(map).then((value) {
        print('Update Success');
        MaterialPageRoute route = MaterialPageRoute(
            builder: (value) => DentProfileScreen(widget.user));
        Navigator.of(context).pushAndRemoveUntil(route, (value) => false);
      });
    }

    // Future<void> deletePic(BuildContext context) async {
    //   String fileName = basename(_image.path);
    //   StorageReference firebaseStorageRef =
    //       FirebaseStorage.instance.ref().child(fileName).delete(_image);
    //       // StorageReference deleteTask = firebaseStorageRef.delete(_image);
    //       // StorageTaskSnapshot taskSnapshot = await deleteTask.onComplete;
    //       setState(() {
    //     print("Profile Picture deleted");
    //     Scaffold.of(context)
    //         .showSnackBar(SnackBar(content: Text('Profile Picture deleted')));
    //   });
    // }

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
                    // child: Container(
                    //   height: 260,
                    //   decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //           begin: Alignment.topCenter,
                    //           colors: [
                    //         Colors.lightBlue[400],
                    //         Colors.blue,
                    //         Colors.indigo[300]
                    //       ])),
                    // ),
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
                                  : Image.asset(
                                      'assets/images/Logo/App-Icon-drop-shadow.jpg',
                                      fit: BoxFit.fill,
                                    ),
                            ),
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
                                  },
                                  child: const Text('Import From Gallery'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: SimpleDialogOption(
                                  onPressed: () {
                                    _pickImageFromCamera();
                                  },
                                  child: const Text('Take Photo'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: SimpleDialogOption(
                                  onPressed: () {},
                                  child: const Text('Remove Profile Photo'),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(210, 210, 0, 0),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.amber[400],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          LineAwesomeIcons.pen,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
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
                            // uploadPic(context);
                            // Navigator.pop(context);
                            if (name.isEmpty ||
                                eMail.isEmpty ||
                                tel.isEmpty ||
                                name == null ||
                                eMail == null ||
                                tel == null) {
                              showAlert(
                                  'Have Space', 'Please Fill Every Blank');
                            } else {
                              Navigator.pop(context);
                              uploadPic();
                              updateDataToFirestore();
                            }
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
                  labelStyle: TextStyle(color: Colors.grey[400]),
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
                    labelText: 'E-mail Address',
                    labelStyle:
                        TextStyle(color: Colors.grey[400], fontSize: 14),
                    hintText: 'Enter your email'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  tel = value.trim();
                },
                decoration: InputDecoration(
                  labelText: 'Phone Number',
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
