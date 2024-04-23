// ignore_for_file: avoid_print
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:med_eg/widgets/custom_button.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class SignUp13 extends StatefulWidget {
  const SignUp13({Key? key}) : super(key: key);

  @override
  _SignUp13State createState() => _SignUp13State();
}

class _SignUp13State extends State<SignUp13> {
  List<File> _images = [];

  Future<void> _getImage() async {
    final resultList = await MultiImagePicker.pickImages(
      maxImages: 6, // Allow selection of up to 6 images
    );
    if (resultList.isNotEmpty) {
      List<File> files = [];
      for (var asset in resultList) {
        final file = await asset.originalHeight;
        files.add(file as File);
      }
      setState(() {
        _images = files;
      });
    }
  }

  Future<void> _saveImages() async {
    if (_images.isEmpty) {
      // Handle no images selected case (e.g., show a snackbar)
      return;
    }

    var body = {};
    for (var i = 0; i < _images.length; i++) {
      var imageFile = _images[i];
      body['image_field_$i'] = await http.MultipartFile.fromPath('image_field', imageFile.path);
    }

    try {
      var response = await http.post(Uri.parse('https://api-medeg.online/api/medEG/face-id'), body: body);
      if (response.statusCode == 200) {
        print('Images saved successfully!');
        // Handle successful upload appropriately (e.g., show a success message)
      } else {
        print('Error saving images: ${response.statusCode}');
        // Handle API errors appropriately (e.g., show an error snackbar)
      }
    } catch (error) {
      print('Error making API request: $error');
      // Handle other errors (e.g., network issues)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Selection and Upload'),
      ),
      body: Center(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true, // Adjust grid height as needed
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Display 3 images per row
              ),
              itemCount: _images.length,
              itemBuilder: (context, index) => Image.file(_images[index], fit: BoxFit.cover),
            ),
            CustomButton(
              text: 'Select Images (Max 6)',
              onTap: _getImage,
            ),
            CustomButton(
              text: 'Save Images',
              onTap: _saveImages,
            ),
          ],
        ),
      ),
    );
  }
}



/*  Future<File?> pickImage() async {
    final imagePicker = ImagePicker();
    final selectedSource = await showDialog<ImageSource>(
        context: context,
        builder: (context) => AlertDialog(
            title: const Text('Select Image'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: const Text('Take Photo'),
                  onTap: () =>
                      Navigator.pop(context, ImageSource.camera), // No change
                ),
                ListTile(
                  title: const Text('Choose From Gallery'),
                  onTap: () =>
                      Navigator.pop(context, ImageSource.gallery), // No change
                ),
              ],
            )));

    if (selectedSource != null) {
      final pickedFile = await imagePicker.pickImage(
          source: selectedSource); // Use selectedSource

      if (pickedFile != null) {
        return File(pickedFile.path);
      }
    }
    return null;
  }*/
