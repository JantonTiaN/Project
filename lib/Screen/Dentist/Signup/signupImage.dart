import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SingupImage extends StatefulWidget {
  @override
  _SingupImageState createState() => _SingupImageState();
}

class _SingupImageState extends State<SingupImage> {
  int _imagePosition = 0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestImage"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Select your photos',
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new GestureDetector(
                    onTap: () {
                      _imagePosition = 0;
                      //setInage Defult
                    },
                    child: Container(
                      width: 184,
                      height: 180,
                      child: Image.asset("assets/images/patient.png"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new GestureDetector(
                    onTap: () {
                      _imagePosition = 1;
                      _getImage();
                    },
                    child: Container(
                      width: 184,
                      height: 180,
                      child: Card(
                          child:  Icon(Icons.add_photo_alternate,size: 130, color: Colors.grey[700])),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future _getImage() async {
    // Get image from gallery.
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    // _cropImage(image);
  }

  // Future<Null> _cropImage(File image) async {
  //   File croppedFile = await ImageCropper.cropImage(
  //       sourcePath: image.path,
  //       aspectRatioPresets: Platform.isAndroid
  //           ? [
  //         CropAspectRatioPreset.square,
  //         CropAspectRatioPreset.ratio3x2,
  //         CropAspectRatioPreset.original,
  //         CropAspectRatioPreset.ratio4x3,
  //         CropAspectRatioPreset.ratio16x9
  //       ]
  //           : [
  //         CropAspectRatioPreset.original,
  //         CropAspectRatioPreset.square,
  //         CropAspectRatioPreset.ratio3x2,
  //         CropAspectRatioPreset.ratio4x3,
  //         CropAspectRatioPreset.ratio5x3,
  //         CropAspectRatioPreset.ratio5x4,
  //         CropAspectRatioPreset.ratio7x5,
  //         CropAspectRatioPreset.ratio16x9
  //       ],
  //       androidUiSettings: AndroidUiSettings(
  //           toolbarTitle: 'Cropper',
  //           toolbarColor: Colors.blue[800],
  //           toolbarWidgetColor: Colors.white,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false),
  //       iosUiSettings: IOSUiSettings(
  //           title: 'Cropper',
  //       ));    
  // }
}
