import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:learning_app/models/course.dart';

import '../../widgets/app_bar.dart';
import '../../widgets/list_vew_cards.dart';

class SearchResult extends StatefulWidget {
  final String searchQuery;

  const SearchResult({super.key, required this.searchQuery});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<Course> coursesList = [];

  String query = '';

  void loadCoursesFromJson() async {
    String jsonData = await rootBundle.loadString('json/data.json');
    List<dynamic> coursesJson = jsonDecode(jsonData);
    setState(() {
      coursesList =
          coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    query = widget.searchQuery;
    loadCoursesFromJson();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: default_,
      appBar: AppBarWidget(
        title: "Search Result",
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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: dark_100,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            // space betwe

            children: [
              Container(
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children:  [
                      Expanded(
                        child: Text(
                        "Result for \"$query\"",
                        style: const TextStyle(
                          color: light_100,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      const Text(
                        "Total 10",
                        style: TextStyle(
                          color: light_200,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  )),
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
                      child: ListViewCards(
                        coursesList:  // filter by query that title, author, category contains query
                            coursesList.where((course) => course.title.contains(query) || course.author.contains(query) || course.category.contains(query)).toList(),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
