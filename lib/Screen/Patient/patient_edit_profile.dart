import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fundee/Screen/Patient/patient_menu_screen.dart';
import 'package:fundee/Screen/Patient/patient_profile_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fundee/Screen/signin_screen.dart';

class PatientEditProfile extends StatefulWidget {
  final FirebaseUser user;
  PatientEditProfile(this.user, {Key key}) : super(key: key);
  @override
  _PatientEditProfileState createState() => _PatientEditProfileState();
}

class _PatientEditProfileState extends State<PatientEditProfile> {
  File _image;
  final _picker = ImagePicker();
  TextEditingController displayNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String name, eMail, tel, urlPicture;
  final FacebookLogin _facebookLogin = FacebookLogin();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    super.initState();
    getClinic();
    displayNameController = TextEditingController(
        text: widget.user != null ? widget.user.displayName : '');
    emailController = TextEditingController(
        text: widget.user != null ? widget.user.email : '');
  }

  Future _signOut(BuildContext context) async {
    await _auth.signOut();
    FirebaseAuth.instance.signOut();
    await _googleSignIn.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()),
        (route) => false);
  }

  Future<void> uploadPic(String _url) async {
    String pic = widget.user.uid;
    FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    StorageReference storageReference =
        firebaseStorage.ref().child('patientProfile/$pic.jpg');
    StorageUploadTask storageUploadTask = storageReference.putFile(_image);
    urlPicture =
        await (await storageUploadTask.onComplete).ref.getDownloadURL();
    print('urlPicture = $urlPicture');
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
        .collection('Patients')
        .document(widget.user.uid);
    DocumentReference allUser = firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Patients')
        .document(widget.user.uid);
    userUpdateInfo.displayName = _name;
    user.updateProfile(userUpdateInfo);
    clinicDentist.updateData({'fullName': _name});
    allUser.updateData({'fullName': _name}).then((value) => MaterialPageRoute(
        builder: (value) => PatientProfileScreen(widget.user)));
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
        .collection('Patients')
        .document(widget.user.uid);
    DocumentReference allUser = firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Patients')
        .document(widget.user.uid);
    user.updateEmail(_eMail);
    clinicDentist.updateData({'eMail': _eMail});
    allUser.updateData({'eMail': _eMail});
    print('Update Success');
    _signOut(context);
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
        .collection('Patients')
        .document(widget.user.uid);
    DocumentReference allUser = firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Patients')
        .document(widget.user.uid);
    userUpdateInfo.photoUrl = pic;
    user.updateProfile(userUpdateInfo);
    clinicDentist.updateData({'pathImage': pic});
    allUser.updateData({'pathImage': pic});
    MaterialPageRoute(builder: (value) => PatientProfileScreen(widget.user));
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
        .collection('Patients')
        .document(widget.user.uid);
    DocumentReference allUser = firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Patients')
        .document(widget.user.uid);
    userUpdateInfo.displayName = _name;
    user.updateEmail(_eMail);
    user.updateProfile(userUpdateInfo);
    clinicDentist.updateData({'fullName': _name, 'eMail': _eMail});
    allUser.updateData({'fullName': _name, 'eMail': _eMail});
    print('Update Success');
    _signOut(context);
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
        .collection('Patients')
        .document(widget.user.uid);
    DocumentReference allUser = firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Patients')
        .document(widget.user.uid);
    user.updateEmail(_eMail);
    userUpdateInfo.photoUrl = pic;
    user.updateProfile(userUpdateInfo);
    clinicDentist.updateData({'eMail': _eMail, 'pathImage': pic});
    allUser.updateData({'_eMail': _eMail, 'pathImage': pic});
    print('Update Success');
    _signOut(context);
  }

  Future<void> updateNameAndPic(String name, String pic) async {
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
        .collection('Patients')
        .document(widget.user.uid);
    DocumentReference allUser = firestore
        .collection('FunD')
        .document('funD')
        .collection('AllUsers')
        .document('allUsers')
        .collection('Patients')
        .document(widget.user.uid);
    userUpdateInfo.photoUrl = pic;
    userUpdateInfo.displayName = name;
    user.updateProfile(userUpdateInfo);
    clinicDentist.updateData({'fullName': name, 'pathImage': pic});
    allUser.updateData({'fullName': name, 'pathImage': pic});
    MaterialPageRoute(builder: (value) => PatientProfileScreen(widget.user));
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
        .collection('Patients')
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
    documentReference.updateData(map).then((value) {
      print('Update Success');
      return _signOut(context);
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
                                        .collection('FunD')
                                        .document('funD')
                                        .collection('Clinic')
                                        .document('clinic')
                                        .collection(clinic)
                                        .document(clinic)
                                        .collection('Patients')
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
                              if (urlPicture != null) {
                                uploadPic(urlPicture);
                                updateNameAndPic(name, urlPicture);
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
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                onChanged: (value) {
                  name = value.trim();
                },
                decoration: new InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey[100])),
                ),
                controller: displayNameController,
              ),
            ),
            // Divider(
            //   color: Colors.blueGrey[100],
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(left: 20, top: 10),
            //   child: Align(
            //     alignment: Alignment.bottomLeft,
            //     child: Text(
            //       'Profile Information',
            //       style: TextStyle(fontSize: 16),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  eMail = value.trim();
                },
                decoration: InputDecoration(
                  labelText: 'E-Mail Address',
                  labelStyle: TextStyle(color: Colors.grey[400], fontSize: 14),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey[100])),
                ),
                controller: emailController,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
