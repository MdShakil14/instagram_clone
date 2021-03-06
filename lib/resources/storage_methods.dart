import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageMethods{
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> uploadToStorage(String childName, Uint8List file,bool isPost) async{
    
   Reference ref = _firebaseStorage.ref().child(childName).child(_firebaseAuth.currentUser!.uid);
   
   UploadTask uploadTask = ref.putData(file);
   TaskSnapshot taskSnapshot = await uploadTask;
   String downLoadURL = await taskSnapshot.ref.getDownloadURL();

   return downLoadURL;
    
  }
}