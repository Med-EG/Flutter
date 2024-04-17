import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Testtt extends StatefulWidget {
  const Testtt({Key? key}) : super(key: key);

  @override
  _TestttState createState() => _TestttState();
}

class _TestttState extends State<Testtt> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black),
                image: _image != null
                    ? DecorationImage(
                        image: FileImage(_image!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            IconButton(
              onPressed: () {
                // Show dialog to choose camera or gallery
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Choose image source"),
                      actions: <Widget>[
                        TextButton(
                          child: Text("Camera"),
                          onPressed: () {
                            _getImage(ImageSource.camera);
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text("Gallery"),
                          onPressed: () {
                            _getImage(ImageSource.gallery);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.camera, color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
