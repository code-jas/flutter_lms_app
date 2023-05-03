import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/widgets/app_bar.dart';

class ExploreCourse extends StatefulWidget {
  const ExploreCourse({super.key});

  @override
  State<ExploreCourse> createState() => _ExploreCourseState();
}

class _ExploreCourseState extends State<ExploreCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: default_,
      appBar: AppBarWidget(
        title: "Explore",
        paddingController: 9,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 9.0, right: 25.0),
            child: IconButton(
              icon: const Icon(
                FeatherIcons.bell,
                color: light_100,
                size: 20,
              ),
              // ignore: avoid_print
              onPressed: () => print("Bell Icon"),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 9),
            height: MediaQuery.of(context).size.height * 0.804,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: dark_100,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
