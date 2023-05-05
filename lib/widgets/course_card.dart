import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:learning_app/models/course.dart';
import 'package:learning_app/screens/main/course_detail.dart';

class CourseCard extends StatefulWidget {
  final int id;
  final String title;
  final String author;
  final String authorImage;
  final String shortDescription;
  final String ratings;
  final List<String> category;
  final List<String> description;
  final List<CourseContent> contents;

  const CourseCard({
    super.key,
    required this.id,
    required this.title,
    required this.category,
    required this.author,
    required this.authorImage,
    required this.ratings,
    required this.shortDescription,
    required this.description,
    required this.contents,
  });

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetail(
                id: widget.id,
                title: widget.title,
                category: widget.category,
                description: widget.description,
                author: widget.author,
                authorImage: widget.authorImage,
                contents: widget.contents),
          ),
        );
      },
      child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: dark_200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: const TextStyle(
                              color: light_200,
                              fontFamily: 'DMSans',
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.shortDescription,
                            style: const TextStyle(
                              color: light_200,
                              fontFamily: 'DMSans',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              // add icon star with filled color
                              const Icon(
                                FeatherIcons.star,
                                color: primary,
                                size: 12,
                              ),

                              const SizedBox(width: 5),
                              Text(
                                widget.ratings,
                                style: const TextStyle(
                                  color: light_200,
                                  fontFamily: 'DMSans',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              // add separator
                              const Text(
                                '·',
                                style: TextStyle(
                                  color: light_200,
                                  fontFamily: 'DMSans',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'By ${widget.author}',
                                style: const TextStyle(
                                  color: dark_300,
                                  fontFamily: 'DMSans',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 80,
                      width: 80,
                      child: const Icon(
                        Icons.play_arrow,
                        color: light_100,
                      ),
                    ), // Container Card Image
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
