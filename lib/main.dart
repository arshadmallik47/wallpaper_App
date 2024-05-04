import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wallpapper_app/auth/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  // options: FirebaseOptions(apiKey:'AIzaSyBIeSIK7b8NxKGKFNXlZ6GO1GRIkh1IViU', appId: "1:775497787978:android:184f6c59074269db1d14b3", messagingSenderId: messagingSenderId, projectId: projectId)
  // );
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
            apiKey: 'AIzaSyCIprU_qyJUj2WcwgBaNnGb-KkaGcTK9ak',
            appId: '1:683988091735:android:ef184b54cc31f5d9ff7412',
            messagingSenderId: '683988091735',
            projectId: 'wallpaper-app-eca9c',
            storageBucket: 'wallpaper-app-eca9c.appspot.com',
          ),
        )
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpaper App',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: const SplashScreen(),
    );
  }
}
