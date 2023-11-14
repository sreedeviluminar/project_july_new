import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBDLdz7qegczVSzzxCOcaOUwrnZ_zwzd-8",
          appId: "1:490313053840:android:7e09d6d151562af47cca15",
          messagingSenderId: '',
          projectId: "my-project-july-402304",
          storageBucket: "my-project-july-402304.appspot.com"
      ));
  runApp(MaterialApp(
    home: Fire_Storage(),
  ));
}

class Fire_Storage extends StatefulWidget {
  const Fire_Storage({super.key});

  @override
  State<Fire_Storage> createState() => _Fire_StorageState();
}

class _Fire_StorageState extends State<Fire_Storage> {
  final FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Storage"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () => upload("Camera"),
                  minWidth: 120,
                  height: 40,
                  color: Colors.green,
                  child: Text("Camera"),
                ),
                MaterialButton(
                  onPressed: () => upload("Gallery"),
                  minWidth: 120,
                  height: 40,
                  color: Colors.purple,
                  child: Text("Gallery"),
                ),
              ],
            ),
            Expanded(
                child: FutureBuilder(

                    ///if firebase connection is success then executes this function
                    future: loadData(),
                    builder: (context,
                        AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                            itemBuilder: (context, index) {});
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }))
          ],
        ),
      ),
    );
  }

  loadData() {}

  Future<void> upload(String imageinput) async {
    final picker = ImagePicker();
    XFile? pickedImage; // platform dependent path
    try {
      pickedImage = await picker.pickImage(
          source: imageinput == "Camera"
              ? ImageSource.camera
              : ImageSource.gallery);
      final String filename = path.basename(pickedImage!.path);
      File imagefile = File(pickedImage.path); // relative path

      try {
        await storage.ref(filename).putFile(
            imagefile,
            SettableMetadata(customMetadata: {
              'uploaded_by': 'SomeOne!!!',
              'description': "Some Description...."
            }));

        setState(() {});
      } on FirebaseException catch (e) {
        print(e);
      }
    } catch (e) {
      print(e);
    }
  }
}
