import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class LoginSrv {
  static Future<UserCredential?> register(String email, String password) async {
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      log('this app has error $e');
      return null;
    }
  }

  static Future<UserCredential?> login(String email, String password) async {
    try {
      final user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user;
    } catch (e) {
      log('this app has error $e');
      return null;
    }
  }
}
