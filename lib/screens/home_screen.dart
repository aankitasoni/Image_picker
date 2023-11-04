import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _selectedImage;
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    MaterialButton(
                      color: Colors.blue,
                      onPressed: () {
                        _pickImageFromGallery();
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: const Text(
                        'Pick Image from Gallery',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    MaterialButton(
                      color: Colors.red,
                      onPressed: () {
                        _pickImageFromCamera();
                        setState(() {
                          isSelected = !isSelected;
                        });
                      },
                      child: const Text(
                        'Click Image from Camera',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _selectedImage != null ? Image.file(_selectedImage!, fit: BoxFit.cover, height: 200, width: 200, ) : const Text('Please select an Image')
                  ],
                ),
              ),
            ),
          ),

          Positioned(
            top: 467,
            bottom: 70,
            left: 128,
            child: isSelected
                ? Center(
                  child: SizedBox(
              width: 127,
                    child: Center(
                      child: TextFormField(
              decoration: const InputDecoration(
                      hintText: 'Enter Name Here',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
              ),
              style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
              ),
            ),
                    ),
                  ),
                )
                : const SizedBox(), // If not selected, display an empty SizedBox
          ),
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);

    if(returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }


  Future _pickImageFromCamera() async {
    final returnedImage =
    await ImagePicker().pickImage(source: ImageSource.camera);

    if(returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }
}

