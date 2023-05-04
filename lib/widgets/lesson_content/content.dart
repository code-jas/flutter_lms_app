import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/models/course.dart';

// ignore: must_be_immutable
class ContentMaterial extends StatefulWidget {
  List<CourseSubTopic> topicList;
  ContentMaterial({super.key, required this.topicList});

  @override
  State<ContentMaterial> createState() => _ContentMaterialState();
}

class _ContentMaterialState extends State<ContentMaterial> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget.topicList.length,
        itemBuilder: (BuildContext context, int index) {
          CourseSubTopic topic = widget.topicList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  topic.subTopic,
                  style: const TextStyle(
                    color: light_100,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: topic.subTopicContent.length,
                itemBuilder: (BuildContext context, int index) {
                  String content = topic.subTopicContent[index];
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: const BoxDecoration(color: dark_200),
                    child: Text(
                      content,
                      style: const TextStyle(
                        color: light_100,
                        fontSize: 14,
                        height: 1.5,
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
