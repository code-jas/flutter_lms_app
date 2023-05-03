import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:learning_app/widgets/course_card.dart';

class ListViewCards extends StatefulWidget {
  const ListViewCards({super.key});

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
          itemCount: 6, // Replace this with the actual number of items you have
          itemBuilder: (BuildContext context, int index) {
            return const CourseCard();
          },
        ),
      )

    )
    
;
  }
}
