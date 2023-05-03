import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/widgets/app_bar.dart';
import 'package:learning_app/widgets/my_course/done.dart';
import 'package:learning_app/widgets/my_course/in_progress.dart';

class MyCourse extends StatefulWidget {
  const MyCourse({super.key});

  @override
  State<MyCourse> createState() => _MyCourseState();
}

class _MyCourseState extends State<MyCourse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: default_,
      appBar: AppBarWidget(
        title: "My Courses",
        paddingController: 9,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 9.0, right: 25.0),
            child: IconButton(
              icon: const Icon(
                FeatherIcons.bell,
                color: light_100,
                size: 20,
              ),
              // ignore: avoid_print
              onPressed: () => print("Bell Icon"),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 9),
          height: MediaQuery.of(context).size.height * 0.804,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: dark_100,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 30, right: 30),
                  child: const Material(
                    color: dark_100,
                    child: TabBar(
                      labelColor: light_100,
                      unselectedLabelColor: light_400,
                      indicatorWeight: 1,
                      indicator: BoxDecoration(
                          color:
                              dark_100 // Change this to match your background color
                          ),
                      tabs: [
                        Tab(
                          child: Text(
                            "In Progress",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Done",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      InProgress(),
                      Done(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
