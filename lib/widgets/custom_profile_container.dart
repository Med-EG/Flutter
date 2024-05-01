import 'dart:io';
import 'package:flutter/material.dart';
import 'package:med_eg/constants/colors.dart';
import 'package:image_picker/image_picker.dart';

class CustomProfileContainer extends StatefulWidget {
  const CustomProfileContainer({Key? key}) : super(key: key);

  @override
  _CustomProfileContainerState createState() => _CustomProfileContainerState();
}

class _CustomProfileContainerState extends State<CustomProfileContainer> {
  ImageProvider? _image;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = FileImage(File(pickedFile.path));
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.3,
      width: screenWidth * 0.3,
      decoration: const BoxDecoration(
        color: Color(0xffE7E7E7),
        shape: BoxShape.circle,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: _image != null
                ? CircleAvatar(
                    backgroundImage: _image,
                    radius: screenHeight * 0.1,
                  )
                : Container(),
          ),
          Positioned(
            bottom: screenHeight * 0.06,
            right: screenWidth * 0.001,
            child: Container(
              height: screenHeight * 0.05,
              width: screenHeight * 0.05,
              decoration: const BoxDecoration(
                  color: kPrimaryColor, shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(
                  Icons.add,
                ),
                color: Colors.white,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Choose image source"),
                        actions: <Widget>[
                          TextButton(
                            child: const Text("Camera"),
                            onPressed: () {
                              _getImage(ImageSource.camera);
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            child: const Text("Gallery"),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
