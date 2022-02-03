import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user.dart' as model;
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
    String result = 'Some error occurred';
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty ||
          userName.isNotEmpty ||
      file != null) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String photoURL =
            await StorageMethods().uploadToStorage('profilePic', file, false);

        model.User user = model.User(
          userName: userName,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          followers: [],
          following: [],
          photoURL: photoURL,
        );



        await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson());
        //Add user to database
        result = 'success';
      } else {
        result = 'Please enter all the field';
      }
    } catch (error) {
      return error.toString();
    }
    return result;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String result = 'Some error occurred';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        result = 'Succes';
      } else {
        result = 'Please enter all the feild';
      }
    }
    // on FirebaseAuthException catch(error){
    //   if(error.code == '')
    // }
    catch (error) {
     return error.toString();
    }
    return result;
  }
}
