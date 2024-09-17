import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'QuickCart',
          style: TextStyle(
            color: Color.fromARGB(255, 249, 231, 149),
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 249, 97, 103),
        centerTitle: true,
      ),
      body: CameraCaptureScreen(),
    ),
  ));
}

class CameraCaptureScreen extends StatefulWidget {
  const CameraCaptureScreen({super.key});

  @override
  _CameraCaptureScreenState createState() => _CameraCaptureScreenState();
}

class _CameraCaptureScreenState extends State<CameraCaptureScreen> {
  File? _image;
  final ImagePicker _picker = ImagePicker();
  Future<void> _openCamera() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 249, 231, 149),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                print('Capture Items pressed');
              },
              child: const Text('Capture Items'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: _openCamera,
              child: const Text('Open Camera'),
            ),
            const SizedBox(height: 20),
            _image != null
                ? Image.file(_image!)
                : const Text('No image captured', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
