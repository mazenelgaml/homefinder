// ignore_for_file: library_private_types_in_public_api, prefer_final_fields, avoid_print

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDialog extends StatefulWidget {
  const ImagePickerDialog({super.key});

  @override
  _ImagePickerDialogState createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  List<Uint8List> _images = [];

  Future<void> _pickImage(ImageSource source) async {
    XFile? pickedFile;
    if (source == ImageSource.gallery) {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    } else {
      pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    }

    if (pickedFile != null) {
      Uint8List bytes = await pickedFile.readAsBytes();
      setState(() {
        _images.add(bytes);
      });
    } else {
      print('No image selected.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Select Image Source'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.gallery);
            },
            child: const Text('Gallery'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _pickImage(ImageSource.camera);
            },
            child: const Text('Camera'),
          ),
        ],
      ),
    );
  }
}
