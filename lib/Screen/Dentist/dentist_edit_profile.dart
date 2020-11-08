import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fundee/Screen/Dentist/dentist_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/signin_screen.dart';
import 'package:fundee/Services/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fundee/Screen/Dentist/dentist_menu_screen.dart';

class DentEditProfile extends StatefulWidget {
  final FirebaseUser user;
  DentEditProfile(this.user, {Key key}) : super(key: key);
  @override
  _DentEditProfileState createState() => _DentEditProfileState();
}

class _DentEditProfileState extends State<DentEditProfile> {
  File _image;
  final _picker = ImagePicker();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final displayNameController = TextEditingController();
  final eMailController = TextEditingController();
  String name, eMail, tel, urlPicture;
  @override
  void initState() {
    super.initState();
    getClinic();
  }

  //value for checkbox timetable
  //mon
  bool monMorning = false;
  bool monAfternoon = false;
  bool monEvening = false;
  //tue
  bool tueMorning = false;
  bool tueAfternoon = false;
  bool tueEvening = false;
  //wed
  bool wedMorning = false;
  bool wedAfternoon = false;
  bool wedEvening = false;
  //thu
  bool thuMorning = false;
  bool thuAfternoon = false;
  bool thuEvening = false;
  //fri
  bool friMorning = false;
  bool friAfternoon = false;
  bool friEvening = false;
  //sat
  bool satMorning = false;
  bool satAfternoon = false;
  bool satEvening = false;
  //sun
  bool sunMorning = false;
  bool sunAfternoon = false;
  bool sunEvening = false;
  var workingTime = new List();

  List _workingTime() {
    String time = '';
    if (monMorning == true) {
      time = 'Monday Morning';
      workingTime.add(time);
    }
    if (monAfternoon == true) {
      time = 'Monday Afternoon';
      workingTime.add(time);
    }
    if (monEvening == true) {
      time = 'Monday Evening';
      workingTime.add(time);
    }
    if (tueMorning == true) {
      time = 'Tuesday Morning';
      workingTime.add(time);
    }
    if (tueAfternoon == true) {
      time = 'Tuesday Afternoon';
      workingTime.add(time);
    }
    if (tueEvening == true) {
      time = 'Tuesday Evening';
      workingTime.add(time);
    }
    if (wedMorning == true) {
      time = 'Wednesday Morning';
      workingTime.add(time);
    }
    if (wedAfternoon == true) {
      time = 'Wednesday Afternoon';
      workingTime.add(time);
    }
    if (wedEvening == true) {
      time = 'Wednesday Evening';
      workingTime.add(time);
    }
    if (thuMorning == true) {
      time = 'Thursday Morning';
      workingTime.add(time);
    }
    if (thuAfternoon == true) {
      time = 'Thursday Afternoon';
      workingTime.add(time);
    }
    if (thuEvening == true) {
      time = 'Thursday Evening';
      workingTime.add(time);
    }
    if (friMorning == true) {
      time = 'Friday Morning';
      workingTime.add(time);
    }
    if (friAfternoon == true) {
      time = 'Friday Afternoon';
      workingTime.add(time);
    }
    if (friEvening == true) {
      time = 'Friday Evening';
      workingTime.add(time);
    }
    if (satMorning == true) {
      time = 'Saturday Morning';
      workingTime.add(time);
    }
    if (satAfternoon == true) {
      time = 'Saturday Afternoon';
      workingTime.add(time);
    }
    if (sunMorning == true) {
      time = 'Sunday Morning';
      workingTime.add(time);
    }
    if (sunAfternoon == true) {
      time = 'Sunday Afternoon';
      workingTime.add(time);
    }
    return workingTime;
  }

  Future<void> uploadPic(String _url) async {
    String pic = widget.user.uid;
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    StorageReference storageReference =
        firebaseStorage.ref().child('dentistProfile/$pic.jpg');
    StorageUploadTask storageUploadTask = storageReference.putFile(_image);
    urlPicture =
        await (await storageUploadTask.onComplete).ref.getDownloadURL();
  }

  Future<void> updateName(String _name) async {
    FirebaseUser user = await _auth.currentUser();
    Firestore firestore = Firestore.instance;
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    DocumentReference clinicDentist = firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(clinic)
        .document(clinic)
        .collection('Dentists')
        .document(widget.user.uid);
    DocumentReference allUser = firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Dentists')
        .document(widget.user.uid);
    userUpdateInfo.displayName = _name;
    user.updateProfile(userUpdateInfo);
    clinicDentist.updateData({'fullName': _name});
    allUser.updateData({'fullName': _name}).then((value) =>
        MaterialPageRoute(builder: (value) => DentProfileScreen(widget.user)));
    print('Update Success');
  }

  Future<void> updateEmail(String _eMail) async {
    FirebaseUser user = await _auth.currentUser();
    Firestore firestore = Firestore.instance;
    DocumentReference clinicDentist = firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(clinic)
        .document(clinic)
        .collection('Dentists')
        .document(widget.user.uid);
    DocumentReference allUser = firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Dentists')
        .document(widget.user.uid);
    user.updateEmail(_eMail);
    clinicDentist.updateData({'eMail': _eMail});
    allUser.updateData({'eMail': _eMail});
    MaterialPageRoute(builder: (value) => SignInScreen());
    print('Update Success');
  }

  Future<void> updatePic(String pic) async {
    FirebaseUser user = await _auth.currentUser();
    Firestore firestore = Firestore.instance;
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    DocumentReference clinicDentist = firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(clinic)
        .document(clinic)
        .collection('Dentists')
        .document(widget.user.uid);
    DocumentReference allUser = firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Dentists')
        .document(widget.user.uid);
    userUpdateInfo.photoUrl = pic;
    user.updateProfile(userUpdateInfo);
    clinicDentist.updateData({'pathImage': pic});
    allUser.updateData({'pathImage': pic});
    MaterialPageRoute(builder: (value) => DentProfileScreen(widget.user));
    print('Update Success');
  }

  Future<void> updateNameAndEmail(String _name, String _eMail) async {
    FirebaseUser user = await _auth.currentUser();
    Firestore firestore = Firestore.instance;
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    DocumentReference clinicDentist = firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(clinic)
        .document(clinic)
        .collection('Dentists')
        .document(widget.user.uid);
    DocumentReference allUser = firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Dentists')
        .document(widget.user.uid);
    userUpdateInfo.displayName = _name;
    user.updateEmail(_eMail);
    user.updateProfile(userUpdateInfo);
    clinicDentist.updateData({'fullName': _name, 'eMail': _eMail});
    allUser.updateData({'fullName': _name, 'eMail': _eMail});
    MaterialPageRoute(builder: (value) => SignInScreen());
    print('Update Success');
  }

  Future<void> updateEmailAndPic(String _eMail, String pic) async {
    FirebaseUser user = await _auth.currentUser();
    Firestore firestore = Firestore.instance;
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    DocumentReference clinicDentist = firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(clinic)
        .document(clinic)
        .collection('Dentists')
        .document(widget.user.uid);
    DocumentReference allUser = firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Dentists')
        .document(widget.user.uid);
    user.updateEmail(_eMail);
    userUpdateInfo.photoUrl = pic;
    user.updateProfile(userUpdateInfo);
    clinicDentist.updateData({'eMail': _eMail, 'pathImage': pic});
    allUser.updateData({'_eMail': _eMail, 'pathImage': pic});
    MaterialPageRoute(builder: (value) => SignInScreen());
    print('Update Success');
  }

  Future<void> updateDataToFirestore(
      String _name, String _email, String _url) async {
    FirebaseUser user = await _auth.currentUser();
    Firestore firestore = Firestore.instance;
    UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
    DocumentReference documentReference = firestore
        .collection('FunD')
        .document('funD')
        .collection('Clinic')
        .document('clinic')
        .collection(clinic)
        .document(clinic)
        .collection('Dentists')
        .document(widget.user.uid);
    Map<String, dynamic> map = Map();
    map['fullName'] = _name;
    map['eMail'] = _email;
    map['pathImage'] = urlPicture;
    userUpdateInfo.displayName = _name;
    userUpdateInfo.photoUrl = urlPicture;
    user.updateProfile(userUpdateInfo);
    documentReference.updateData(map).then((value) {
      print('Update Success');
      MaterialPageRoute(builder: (value) => SignInScreen());
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
                            if (name != null) {
                              if (eMail != null) {
                                if (urlPicture != null) {
                                  uploadPic(urlPicture);
                                  updateDataToFirestore(
                                      name, eMail, urlPicture);
                                }
                                updateNameAndEmail(name, eMail);
                              }
                              updateName(name);
                            }
                            if (eMail != null) {
                              if (urlPicture != null) {
                                uploadPic(urlPicture);
                                updateEmailAndPic(eMail, urlPicture);
                              }
                              updateEmail(eMail);
                            }
                            if (urlPicture != null) {
                              updatePic(urlPicture);
                              uploadPic(urlPicture);
                            }
                            if (name == null ||
                                eMail == null ||
                                urlPicture == null) {
                              Navigator.pop(context);
                            }
                            _workingTime();
                            if (workingTime.isNotEmpty) {
                              dentistWorkingTime(
                                  workingTime, clinic, widget.user.uid);
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
            Divider(
              color: Colors.blueGrey[100],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Profile Information',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
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
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  eMail = value.trim();
                },
                decoration: InputDecoration(
                  labelText: 'E-Mail Address',
                  labelStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                ),
              ),
            ),
            Divider(
              color: Colors.blueGrey[100],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('Available Working Timetable',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                "*(Morning means 9.00-12.00, Afternoon means 13.00-16.00, and Evening means 16.30-20.00)*",
                style: TextStyle(color: Colors.blueGrey, fontSize: 10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Monday",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: monMorning,
                      onChanged: (bool value) {
                        setState(() {
                          monMorning = value;
                        });
                      }),
                  Text(
                    "Morning",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(
                      value: monAfternoon,
                      onChanged: (bool value) {
                        setState(() {
                          monAfternoon = value;
                        });
                      }),
                  Text(
                    "Afternoon",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(
                      value: monEvening,
                      onChanged: (bool value) {
                        setState(() {
                          monEvening = value;
                        });
                      }),
                  Text(
                    "Evening",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Tuesday",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: tueMorning,
                      onChanged: (bool value) {
                        setState(() {
                          tueMorning = value;
                        });
                      }),
                  Text(
                    "Morning",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(
                      value: tueAfternoon,
                      onChanged: (bool value) {
                        setState(() {
                          tueAfternoon = value;
                        });
                      }),
                  Text(
                    "Afternoon",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(
                      value: tueEvening,
                      onChanged: (bool value) {
                        setState(() {
                          tueEvening = value;
                        });
                      }),
                  Text(
                    "Evening",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Wednesday",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: wedMorning,
                      onChanged: (bool value) {
                        setState(() {
                          wedMorning = value;
                        });
                      }),
                  Text(
                    "Morning",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(
                      value: wedAfternoon,
                      onChanged: (bool value) {
                        setState(() {
                          wedAfternoon = value;
                        });
                      }),
                  Text(
                    "Afternoon",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(
                      value: wedEvening,
                      onChanged: (bool value) {
                        setState(() {
                          wedEvening = value;
                        });
                      }),
                  Text(
                    "Evening",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Thursday",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: thuMorning,
                      onChanged: (bool value) {
                        setState(() {
                          thuMorning = value;
                        });
                      }),
                  Text(
                    "Morning",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(
                      value: thuAfternoon,
                      onChanged: (bool value) {
                        setState(() {
                          thuAfternoon = value;
                        });
                      }),
                  Text(
                    "Afternoon",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(
                      value: thuEvening,
                      onChanged: (bool value) {
                        setState(() {
                          thuEvening = value;
                        });
                      }),
                  Text(
                    "Evening",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Friday",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: friMorning,
                      onChanged: (bool value) {
                        setState(() {
                          friMorning = value;
                        });
                      }),
                  Text(
                    "Morning",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(
                      value: friAfternoon,
                      onChanged: (bool value) {
                        setState(() {
                          friAfternoon = value;
                        });
                      }),
                  Text(
                    "Afternoon",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(
                      value: friEvening,
                      onChanged: (bool value) {
                        setState(() {
                          friEvening = value;
                        });
                      }),
                  Text(
                    "Evening",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Saturday",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: satMorning,
                      onChanged: (bool value) {
                        setState(() {
                          satMorning = value;
                        });
                      }),
                  Text(
                    "Morning",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(
                      value: satAfternoon,
                      onChanged: (bool value) {
                        setState(() {
                          satAfternoon = value;
                        });
                      }),
                  Text(
                    "Afternoon",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(tristate: true, value: null, onChanged: null),
                  Text(
                    "Evening",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Sunday",
                  style: TextStyle(
                      color: Colors.red[400],
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: sunMorning,
                      onChanged: (bool value) {
                        setState(() {
                          sunMorning = value;
                        });
                      }),
                  Text(
                    "Morning",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(
                      value: sunAfternoon,
                      onChanged: (bool value) {
                        setState(() {
                          sunAfternoon = value;
                        });
                      }),
                  Text(
                    "Afternoon",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  Checkbox(tristate: true, value: null, onChanged: null),
                  Text(
                    "Evening",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
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
