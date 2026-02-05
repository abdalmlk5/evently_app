import 'package:evently_app/core/firebase/firebase_functions.dart';
import 'package:evently_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  User? firebaseUser;
  UserModel? user;

  AuthProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      readUser();
    }
  }

  Future<void> readUser() async {
    user = await FirebaseFunctions.readUser();
    notifyListeners();
  }
}
