import 'package:flutter/material.dart';
import 'package:feather_icons/feather_icons.dart';

import 'package:learning_app/constants/colors.dart';

import 'package:learning_app/screens/main/account_screen.dart';
import 'package:learning_app/screens/main/explore_course_screen.dart';
import 'package:learning_app/screens/main/home_screen.dart';
import 'package:learning_app/screens/main/my_course_screen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  final ScrollController _homeController = ScrollController();

  late List<Widget> tabs;

  @override
  void initState() {
    super.initState();

    tabs = [
      HomeScreen(),
      const ExploreCourse(),
      const MyCourse(),
      const Account(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark_100,
      body: tabs[_selectedIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        child: Container(
          color: dark_200,
          height: 70,
          child: BottomNavigationBar(
            backgroundColor: dark_200,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.search),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.playCircle),
                label: 'Course',
              ),
              BottomNavigationBarItem(
                icon: Icon(FeatherIcons.user),
                label: 'Account',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedIconTheme: const IconThemeData(size: 30),
            unselectedItemColor: dark_200,
            selectedFontSize: 0,
            elevation: 0,
            unselectedFontSize: 0,
            selectedItemColor: secondary,
            onTap: (int index) {
              switch (index) {
                case 0:
                  // only scroll to top when current index is selected.
                  if (_selectedIndex == index) {
                    _homeController.animateTo(
                      0.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeOut,
                    );
                  }
                  break;
              }
              setState(
                () {
                  _selectedIndex = index;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
