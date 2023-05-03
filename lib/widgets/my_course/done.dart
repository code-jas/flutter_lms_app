import 'package:flutter/material.dart';
import 'package:learning_app/widgets/my_course/my_course_card.dart';

class Done extends StatefulWidget {
  const Done({super.key});

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount:
              10, // Replace this with the actual number of items you have
          itemBuilder: (BuildContext context, int index) {
            return const MyCourseCard();
          },
        ),
      ),
    );
  }
}
