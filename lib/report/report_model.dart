import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddReportModel extends ChangeNotifier {
  String? reportedUserName;
  String? reportContents;

  final picker = ImagePicker();

  Future addReport() async {
    final db = FirebaseFirestore.instance;
    final uid = FirebaseAuth.instance.currentUser!.uid;

      final document =
      await FirebaseFirestore.instance.collection('users').doc(uid).get();
      Map<String, dynamic> data = document.data() as Map<String, dynamic>;
      db
          .collection("reports")
          .add({
        "reporterUid": uid,
        "reporterName": data['nickname'],
        "creatorUniversity": data['university'],
        "creatorFaculty": data['faculty'],
        "reportedUserName": reportedUserName,
        "reportContents": reportContents,
        "createdAt": DateTime.now(),
        "updatedAt": DateTime.now()
      });
  }
}