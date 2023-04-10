import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/src/app/app.dart';
import 'package:chat_app/src/service/user_manage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final isAuth = await userMan.init();
  runApp(MyApp(isAuth));
}
