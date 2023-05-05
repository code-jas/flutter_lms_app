// import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:learning_app/models/course.dart';
import 'package:learning_app/widgets/course_card.dart';

class ListViewCards extends StatefulWidget {
  final List<Course> coursesList;
  const ListViewCards({super.key, required this.coursesList});

  @override
  State<ListViewCards> createState() => _ListViewCardsState();
}

class _ListViewCardsState extends State<ListViewCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.coursesList.length,
          itemBuilder: (BuildContext context, int index) {
            Course course = widget.coursesList[index];
            return CourseCard(
              id: course.id,
              title: course.title,
              category: course.category,
              shortDescription: course.shortDescription,
              ratings: course.ratings,
              description: course.description,
              author: course.author,
              contents: course.contents,
              authorImage: course.authorImage,
            );
          },
        ),
      ),
    );
  }
}
