import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //Sign Up User

  Future<String> signUpUser({
    required String userName,
    required String email,
    required String password,
    required String bio,
    required Uint8List file,
  }) async {
    String res = 'Some error occurred';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          userName.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
       String photoURL = await StorageMethods().uploadToStorage('profilePic', file, false);

        await _firestore.collection('users').doc(cred.user!.uid).set({
          'userName': userName,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'password': password,
          'photoURL': photoURL,
        });
        //Add user to database
        res = 'Success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
