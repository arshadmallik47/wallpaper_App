import 'package:flutter/material.dart';
import 'package:wallpapper_app/auth/splash_screen.dart';


void main() {
  
  runApp(
    const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wallpapper App',
      theme: ThemeData(
        primarySwatch: Colors.purple

      ),
      home: const SplashScreen(),
    );
  }
}
