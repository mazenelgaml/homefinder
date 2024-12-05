// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class CombinedImagePicker extends StatefulWidget {
  const CombinedImagePicker({super.key});

  @override
  _CombinedImagePickerState createState() => _CombinedImagePickerState();
}


class _CombinedImagePickerState extends State<CombinedImagePicker> {
  final List<Uint8List> _images = [];

  Future<void> _pickImage() async {
    final ImageSource? source = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Gallery'),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  child: const Text('Camera'),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );


    if (source != null) {
      XFile? pickedFile;
      if (source == ImageSource.camera) {
        pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      } else {
        pickedFile = (await ImagePicker().pickMultiImage()).first;
      }

      if (pickedFile != null) {
        Uint8List bytes = await pickedFile.readAsBytes();
        setState(() {
          _images.add(bytes);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: _pickImage,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Image.memory(
                    _images[index],
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
