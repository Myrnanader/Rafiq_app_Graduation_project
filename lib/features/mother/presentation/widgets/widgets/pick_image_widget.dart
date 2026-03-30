import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImagePage extends StatelessWidget {
  const PickImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ImagePicker picker = ImagePicker();

    Future<void> pickImage() async {
      final XFile? pickedFile =
      await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        Navigator.pop(context, File(pickedFile.path));
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Pick Image')),
      body: Center(
        child: ElevatedButton(
          onPressed: pickImage,
          child: const Text('Choose Image from Gallery'),
        ),
      ),
    );
  }
}