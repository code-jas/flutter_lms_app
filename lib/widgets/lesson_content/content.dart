import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:feather_icons/feather_icons.dart';

class ContentMaterial extends StatefulWidget {
  const ContentMaterial({super.key});

  @override
  State<ContentMaterial> createState() => _ContentMaterialState();
}

class _ContentMaterialState extends State<ContentMaterial> {
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: const Text(
                            "Introduction to Flutter",
                            style: TextStyle(
                              color: light_100,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          decoration: const BoxDecoration(
                             
                              color: dark_200),
                          child: const Text(
                            "JavaScript is a scripting language you can use to make web pages interactive. It is one of the core technologies of the web, along with HTML and CSS, and is supported by all modern browsers. In this course, you'll learn fundamental programming concepts in JavaScript. You'll start with basic data structures like numbers and strings. Then you'll learn to work with arrays, objects, functions, loops, if/else statements, and more.",
                            style: TextStyle(
                              color: light_100,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    );
                  },
                );
  }
}