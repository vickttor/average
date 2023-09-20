import 'package:average/screens/home/components/header.dart';
import 'package:average/screens/home/components/homework_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            HomeHeader(),
            // HomeWorks Lists
            HomeworkList(),

            // Footer to Calculate Average
          ],
        ),
      ),
    );
  }
}
