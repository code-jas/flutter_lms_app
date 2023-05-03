import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';

class ExploreCourse extends StatefulWidget {
  const ExploreCourse({super.key});

  @override
  State<ExploreCourse> createState() => _ExploreCourseState();
}

class _ExploreCourseState extends State<ExploreCourse> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: dark_100,
      body: SizedBox(
        child: Center(
          child: Text(
            "Explore",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
