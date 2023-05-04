import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/models/course.dart';
import 'package:learning_app/widgets/app_bar.dart';
import 'package:learning_app/widgets/lesson_content/content.dart';

// ignore: must_be_immutable
class LessonContent extends StatefulWidget {
  final String topicTitle;
  List<CourseSubTopic> topicList;

  LessonContent({
    super.key,
    required this.topicTitle,
    required this.topicList,
  });

  @override
  State<LessonContent> createState() => _LessonContentState();
}

class _LessonContentState extends State<LessonContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: default_,
      appBar: AppBarWidget(
        title: widget.topicTitle,
        paddingController: 9,
        actions: const [],
      ),
      body: ClipRect(
        clipBehavior: Clip.antiAliasWithSaveLayer,
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
          // create a list view
          child: Column(
            children: [
              Expanded(
                child: ContentMaterial(topicList: widget.topicList),
              ),

              // add button for mark as read
              Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(color: primary),
                child: const Text(
                  "Mark as read",
                  style: TextStyle(
                    color: light_100,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
