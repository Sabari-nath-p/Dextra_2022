import 'dart:html';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class photoupload extends StatefulWidget {
  const photoupload({Key? key}) : super(key: key);

  @override
  State<photoupload> createState() => _photouploadState();
}

class _photouploadState extends State<photoupload> {
  final _firebaseStorage = FirebaseStorage.instance;
  final _imagePicker = ImagePicker();
  late File image1, image2, image3, image4, image5;
  late PickedFile pickedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(
            children: [
              Text(
                'Spot Photography',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'MOOD',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    margin:
                        EdgeInsets.only(top: density(10), left: density(10)),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text('  Admin Login  '),
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF0A75BC),
                            shape: StadiumBorder())),
                  ),
                 
                   
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  double density(double d) {
    double height = MediaQuery.of(context).size.width;
    double value = d * (height / 384);
    return value;
  }
}
