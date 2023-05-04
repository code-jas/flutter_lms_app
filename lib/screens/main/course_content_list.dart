import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/models/course.dart';
import 'package:learning_app/screens/main/lesson_content.dart';
import 'package:learning_app/widgets/app_bar.dart';

// ignore: must_be_immutable
class CourseContentList extends StatefulWidget {
  String title;
  List<CourseContent> contents;
  CourseContentList({super.key, required this.title, required this.contents});

  @override
  State<CourseContentList> createState() => _CourseContentListState();
}

class _CourseContentListState extends State<CourseContentList> {
  List<String> items = [
    'Introduction to Flutter',
    'Intermediate Flutter',
    'Advanced Flutter',
    'Create Widgets in Flutter',
    'Create Apps in Flutter',
    'Create Games in Flutter',
    'Dynamic Apps in Flutter',
    'Create fully function Facebook in Flutter',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: default_,
      appBar: AppBarWidget(
        title: widget.title,
        paddingController: 9,
        actions: const [],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            _topicList(),
            _joinButton(),
          ],
        ),
      ),
    );
  }

  _topicList() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: widget.contents.length,
        itemBuilder: (BuildContext context, int index) {
          CourseContent content = widget.contents[index];

          return Container(
            decoration: BoxDecoration(
              color: dark_200,
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.only(bottom: 10.0),
            child: TextButton(
              onPressed: () {
                // Your button onPressed code here
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LessonContent(
                      topicTitle: content.title,
                      topicList: content.subTopicList,
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          content.title, // Display the title property here
                          style: const TextStyle(
                            color: light_100,
                            fontFamily: 'DMSans',
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              content.type,
                              style: const TextStyle(
                                color: light_300,
                                fontFamily: 'DMSans',
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(width: 10),
                            // add separator
                            const Text(
                              '·',
                              style: TextStyle(
                                color: light_300,
                                fontFamily: 'DMSans',
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              content.duration,
                              style: const TextStyle(
                                color: light_300,
                                fontFamily: 'DMSans',
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  const Icon(FeatherIcons.chevronRight,
                      color: light_100, size: 25.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  _joinButton() {
    return Positioned(
      bottom: 0,
      child: SizedBox(
        height: 48,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () {
            // Show dialog box here
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text(
                    'Enrollment Successful',
                    style: TextStyle(color: success),
                  ),
                  content: const Text('You have successfully enrolled!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: light_100,
            backgroundColor: primary,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
          child: const Text('Join'),
        ),
      ),
    );
  }
}
