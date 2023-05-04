import 'dart:convert';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/models/course.dart';
import 'package:learning_app/widgets/app_bar.dart';
import 'package:learning_app/widgets/list_vew_cards.dart';
import 'package:learning_app/widgets/explore_course/tag_category.dart';

class ExploreCourse extends StatefulWidget {
  const ExploreCourse({Key? key}) : super(key: key);

  @override
  State<ExploreCourse> createState() => _ExploreCourseState();
}

class _ExploreCourseState extends State<ExploreCourse> {
  // add list tags that inline in Information Technology maximum 10

  List<Course> courses = [];

  void loadCoursesFromJson() async {
    String jsonData = await rootBundle.loadString('json/data.json');
    List<dynamic> coursesJson = jsonDecode(jsonData);
    courses =
        coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
    print(courses);
  }

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // form place holder
                Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: dark_200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: light_100,
                              fontFamily: 'DMSans',
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.search,
                        color: light_100,
                      ),
                    ],
                  ),
                ),
                // Browse by category
                const TagCategory(),
                // Recommended Course
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.only(left: 20),
                          child: const Text(
                            'Recommendation',
                            style: TextStyle(
                              color: light_200,
                              fontFamily: 'DMSans',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListViewCards(coursesList: courses),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
