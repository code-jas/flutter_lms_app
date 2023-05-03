import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({super.key});

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: dark_100,
      body: SizedBox(
        child: Center(
          child: Text(
            "Explore",
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
