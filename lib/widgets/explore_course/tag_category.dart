import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';


class TagCategory extends StatefulWidget {
  const TagCategory({super.key});

  @override
  State<TagCategory> createState() => _TagCategoryState();
}

class _TagCategoryState extends State<TagCategory> {
    List<String> tags = [
    'All',
    'Information Technology',
    'Business',
    'Design',
    'Photography',
    'Music',
    'Marketing',
    'Development',
    'Personal Development',
    'Health & Fitness',
    'Office Productivity',
    'Language',
    'Lifestyle',
    'Math & Science',
    'Teaching & Academics',
    'Social Science',
    'Engineering',
    'Humanities',
    'Test Prep',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Browser Category',
                        style: TextStyle(
                          color: light_100,
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      // tags
                      // 1st row
                      Wrap(
                        spacing: 10,
                        children: tags
                            .sublist(0, 5)
                            .map((e) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  margin: const EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                      color: light_100,
                                      fontFamily: 'DMSans',
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ));
  }
}