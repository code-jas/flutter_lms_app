import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/widgets/list_vew_cards.dart';

class ExploreCourse extends StatefulWidget {
  const ExploreCourse({Key? key}) : super(key: key);

  @override
  State<ExploreCourse> createState() => _ExploreCourseState();
}

class _ExploreCourseState extends State<ExploreCourse> {
  // add list tags that inline in Information Technology maximum 10
  List<String> tags = [
    'All',
    'Information Technology',
    'Business',
    'Design',
    'Photography',
    'Music',
    'Marketing',
    'Development',
    'Personal Development',
    'Health & Fitness',
    'Office Productivity',
    'Language',
    'Lifestyle',
    'Math & Science',
    'Teaching & Academics',
    'Social Science',
    'Engineering',
    'Humanities',
    'Test Prep',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: default_,
      appBar: AppBar(
        backgroundColor: default_,
        elevation: 0,
        toolbarHeight: 70,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Explore Courses',
            style: TextStyle(
              color: light_100,
              fontSize: 20,
            ),
          ),
        ),
      ),
      body: Container(
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
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Browser Category',
                        style: TextStyle(
                          color: light_100,
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // tags
                      // 1st row
                      Wrap(
                        spacing: 10,
                        children: tags
                            .sublist(0, 5)
                            .map((e) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      color: light_100,
                                      fontFamily: 'DMSans',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  )),
              // Recommended Course
              Expanded(
                child:Column(
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
                  const SizedBox(height: 20),
                  const Expanded(
                    child: ListViewCards(),
                  ),
                ],
              ),
              )
            ],
          )),
    );
  }
}
