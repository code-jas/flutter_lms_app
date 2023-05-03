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
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Column(
                  children: const [
                    SizedBox(height: 5),
                    Icon(FeatherIcons.home),
                    SizedBox(height: 5),
                  ],
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: const [
                    SizedBox(height: 5),
                    Icon(FeatherIcons.search),
                    SizedBox(height: 5),
                  ],
                ),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: const [
                    SizedBox(height: 5),
                    Icon(FeatherIcons.playCircle),
                    SizedBox(height: 5),
                  ],
                ),
                label: 'Course',
              ),
              BottomNavigationBarItem(
                icon: Column(
                  children: const [
                    SizedBox(height: 5),
                    Icon(FeatherIcons.user),
                    SizedBox(height: 5),
                  ],
                ),
                label: 'Account',
              ),
            ],
            backgroundColor: dark_200,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedIconTheme: const IconThemeData(size: 25),
            unselectedIconTheme: const IconThemeData(size: 20),
            unselectedItemColor: light_100,
            selectedFontSize: 10,
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
