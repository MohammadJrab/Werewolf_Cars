import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseStorageHelper {
  static Future<String> uploadFile(File file, String storagePath) async {
    final ref = FirebaseStorage.instance.ref().child(storagePath);
    final uploadTask = await ref.putFile(file);
    return await uploadTask.ref.getDownloadURL();
  }
}
