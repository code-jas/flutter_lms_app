import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/screens/main/lesson_content.dart';
import 'package:learning_app/widgets/app_bar.dart';

class CourseContentList extends StatefulWidget {
  const CourseContentList({super.key, required String title});

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
      appBar: const AppBarWidget(
        title: "Declarative interface for any Apple Devices",
        paddingController: 9,
        actions: [],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            _topicList(items),
            _joinButton(),
          ],
        ),
      ),
    );
  }

  _topicList(List<String> items) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          String item = items[index];
          return Container(
            decoration: BoxDecoration(
              color: dark_200,
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: const EdgeInsets.only(bottom: 10.0),
            child: TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text(
                        'Error!',
                        style: TextStyle(color: error),
                      ),
                      content: const Text(
                        'Please Enroll First!',
                        style: TextStyle(color: error),
                      ),
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

                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => const LessonContent()));
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item,
                        style: const TextStyle(
                          color: light_100,
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Row(children: const [
                        Text(
                          'Readings',
                          style: TextStyle(
                            color: light_300,
                            fontFamily: 'DMSans',
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(width: 10),
                        // add separator
                        Text(
                          '·',
                          style: TextStyle(
                            color: light_300,
                            fontFamily: 'DMSans',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          '10 mins',
                          style: TextStyle(
                            color: light_300,
                            fontFamily: 'DMSans',
                            fontSize: 12,
                          ),
                        ),
                      ]),
                    ],
                  )),
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
