// ignore_for_file: prefer_const_constructors

import 'package:login_firebase/pages/modules/authPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AuthPage(),
  ));
}

/* If you get error while running the app connecting with firebase
then you can always comment out apply plugin: 'com.google.gms.google-services'
in android->app->build.gradle 
The error is like this ':app:mapDebugSourceSetPaths'.
*/  