import 'package:flutter/material.dart';
import 'package:quizapp/modules/homescreen.dart';
import 'package:quizapp/modules/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      home: Splash(),
    );
  }
}
