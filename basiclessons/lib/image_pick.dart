import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({super.key});

  @override
  State<ImagePick> createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePick> {
  String? path;
  XFile? image;
  
  Future<XFile?> pickImage() async {
    final picker = ImagePicker();

    return await picker.pickImage(source: ImageSource.camera);
    //  ou gallery
  }

  Future<String?> pickedFile() async {
    final pickedFile = await pickImage();

    if (pickedFile != null) {
     setState(() {
        path = pickedFile.path;
     });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: path != null ? Image.file(File(path!),cacheHeight: 50,cacheWidth: 50,) : Text('Selectionnez une photos') ,
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
               pickedFile();
              },
              child: Text('image'),
            ),
          ),
        ],
      ),
    );
  }
}
