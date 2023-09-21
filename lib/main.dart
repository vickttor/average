import 'package:average/constants.dart';
import 'package:average/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Author: Victor Hugo da Silva
/// Finished At 20/09/2023 - 9:47 PM

void main() {
  // Apply Transparent StatusBar
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Color(black),
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Average',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(black),
          background: const Color(white),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
