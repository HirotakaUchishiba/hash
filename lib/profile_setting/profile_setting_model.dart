import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSettingModel extends ChangeNotifier {
  ProfileSettingModel(
      this.nickname,
      this.bio,
      this.photoUrl,
      );
  String? nickname;
  String? bio;
  String? photoUrl;
  File? imageFile;

  final picker = ImagePicker();


  Future updateProfile() async {
      final uid = FirebaseAuth.instance.currentUser!.uid;
      final doc = FirebaseFirestore.instance.collection('users').doc(uid);

      String? photoUrl;
      if (imageFile != null) {
        // storageにアップロード
        final task = await FirebaseStorage.instance
            .ref('users/${doc.id}')
            .putFile(imageFile!);
        photoUrl = await task.ref.getDownloadURL();
      }

      // Firestoreを編集
      await doc.update({
        'nickname': nickname,
        'bio': bio,
        'photoUrl': photoUrl,
      });

  }

  Future pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      final result = await FlutterImageCompress.compressWithFile(
        pickedFile.path,
        minWidth: 600,
        minHeight: 220,
        quality: 80,
      );
      imageFile!.writeAsBytesSync(result!, flush: true, mode: FileMode.write);
      notifyListeners();
    }
  }
}