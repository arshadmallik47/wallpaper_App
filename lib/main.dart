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
            apiKey: 'AIzaSyBIeSIK7b8NxKGKFNXlZ6GO1GRIkh1IViU',
            appId: '1:775497787978:android:184f6c59074269db1d14b3',
            messagingSenderId: '775497787978',
            projectId: 'wallpaper-baa61',
            storageBucket: 'wallpaper-baa61.appspot.com',
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
