import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/widgets/app_bar.dart';

class CourseContentList extends StatefulWidget {
  const CourseContentList({super.key});

  @override
  State<CourseContentList> createState() => _CourseContentListState();
}

class _CourseContentListState extends State<CourseContentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: default_,
      appBar: const AppBarWidget(
        title: "Course Detail",
        paddingController: 9,
        actions: [],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            _topicList(),
          ],
        ),
      ),
    );
  }

  _topicList() {
    return Container();
  }
}
