import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  File? _image;
  final ImagePicker _Picker = ImagePicker();

  Future<void> _pickImageFromCamera()async{
    final XFile? image = await _Picker.pickImage(source: ImageSource.camera);
    if(image != null){
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> _pickImageFromGallery()async{
    final XFile? image = await _Picker.pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
            'Flutter Image Picker',
        style: TextStyle(
          color: Colors.white,
        ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            child: _image==null?const Center(child: Text('no image selected')) : Image.file(_image!),
          ),
          const Divider(),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  onPressed: (){
                    _pickImageFromCamera();
                  },
                child: const Icon(Icons.camera,),
              ),
              const SizedBox(width: 20),
              FloatingActionButton(
                onPressed: (){
                  _pickImageFromGallery();
                },
                child: const Icon(Icons.photo_library,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
