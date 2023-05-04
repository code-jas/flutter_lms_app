import 'package:flutter/material.dart';
import 'package:learning_app/models/course.dart';
import 'package:learning_app/widgets/my_course/my_course_card.dart';

// ignore: must_be_immutable
class InProgress extends StatefulWidget {
  List<Course> coursesList;
  InProgress({super.key, required this.coursesList});

  @override
  State<InProgress> createState() => _InProgressState();
}

class _InProgressState extends State<InProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: (widget.coursesList.length >= 3)
              ? widget.coursesList.length - 3
              : 0,
          itemBuilder: (BuildContext context, int index) {
            Course course = widget.coursesList[index];
            return MyCourseCard(
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
