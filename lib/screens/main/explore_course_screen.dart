import 'dart:convert';
import 'dart:ffi';

import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/models/course.dart';
import 'package:learning_app/widgets/app_bar.dart';
import 'package:learning_app/widgets/list_vew_cards.dart';
import 'package:learning_app/widgets/explore_course/tag_category.dart';
import 'package:learning_app/screens/main/search_result.dart';

class ExploreCourse extends StatefulWidget {

  final ValueChanged<int> onDataChanged;
  final int lastIndex;

  const ExploreCourse({super.key, required this.onDataChanged, required this.lastIndex});

  @override
  State<ExploreCourse> createState() => _ExploreCourseState();
}

class _ExploreCourseState extends State<ExploreCourse> {
  List<Course> courses = [];

  void loadCoursesFromJson() async {
    String jsonData = await rootBundle.loadString('json/data.json');
    List<dynamic> coursesJson = jsonDecode(jsonData);
    setState(() {
      courses =
          coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadCoursesFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: default_,
      appBar: AppBarWidget(
        title: "Explore",
        paddingController: 9,
        lastPage: widget.lastIndex,
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
                    children: [
                      const Expanded(
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
                      const SizedBox(width: 10),
                      // add icon search here with size 20 and with onpress
                      GestureDetector(
                          child: const Icon(
                            FeatherIcons.search,
                            color: light_100,
                            size: 20,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SearchResult(),
                              ),
                            );
                          } //navigate to search screen
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
