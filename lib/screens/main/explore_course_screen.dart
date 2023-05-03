import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';

class ExploreCourse extends StatefulWidget {
  const ExploreCourse({Key? key}) : super(key: key);

  @override
  State<ExploreCourse> createState() => _ExploreCourseState();
}

class _ExploreCourseState extends State<ExploreCourse> {
  // add list tags that inline in Information Technology maximum 10

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: dark_100,
      body: SizedBox(
        child: Center(
          child: Text(
            "Coming Soon",
            style: TextStyle(
              fontSize: 20,
              color: light_100,
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
