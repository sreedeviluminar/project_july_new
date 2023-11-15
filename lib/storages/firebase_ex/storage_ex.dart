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
                            itemCount: snapshot.data?.length ?? 0,
                            itemBuilder: (context, index) {
                              /// fetching each map from the list
                              final Map<String, dynamic> image =
                                  snapshot.data![index];
                              return Card(
                                child: ListTile(
                                  // leading:Image.network(snapshot.data![index]['imageurl']) ,  OR
                                  leading: Image.network(image['imageurl']),
                                  title: Text(image['uploaded_by']),
                                  subtitle: Text(image['description']),
                                  trailing: IconButton(
                                      onPressed: () => deleteImage(image['path']),
                                      icon: const Icon(Icons.delete)),
                                ),
                              );
                            });
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

  Future<List<Map<String, dynamic>>> loadData() async {
    List<Map<String, dynamic>> images = [];
    final ListResult result = await storage
        .ref()
        .list(); // group of values(firebasestorage instance) from firebase storage
    //all the data from firebase stored as a reference
    final List<Reference> allfiles = result.items;

    await Future.forEach(allfiles, (singlefile) async {
      //to get image path (path as network image path)
      final String fileUrl = await singlefile.getDownloadURL();
      final FullMetadata metadata = await singlefile.getMetadata();

      images.add({
        'imageurl': fileUrl,
        'path': singlefile.fullPath,
        'uploaded_by': metadata.customMetadata?['uploaded_by'] ?? "No Data",
        'description': metadata.customMetadata?['description'] ?? "No Data"
      });
    });
    return images;
  }

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
 Future<void> deleteImage(String imagepath) async{
    await storage.ref(imagepath).delete();
    setState(() {});
 }
}
