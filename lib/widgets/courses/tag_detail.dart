import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';

class TagDetail extends StatefulWidget {
  final List<String> tags;
  const TagDetail({super.key, required this.tags});

  @override
  State<TagDetail> createState() => _TagDetailState();
}

class _TagDetailState extends State<TagDetail> {
  // List<String> tags = [
  //   'Swift Ui',
  //   'Flutter',
  //   'Figma',
  //   'Vue',
  //   'Software Development',
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 10,
            children: widget.tags
                .sublist(0, 4)
                .map((e) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: secondary,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        e,
                        style: const TextStyle(
                          color: secondary,
                          fontFamily: 'DMSans',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
