import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:learning_app/models/course.dart';
import 'package:learning_app/screens/main/course_content_list.dart';
import 'package:learning_app/widgets/app_bar.dart';
import 'package:learning_app/widgets/courses/tag_detail.dart';

class CourseDetail extends StatefulWidget {
  final String title;
  final String author;
  final String authorImage;
  final List<String> category;
  final List<String> description;
  final List<CourseContent> contents;

  const CourseDetail({
    super.key,
    required this.title,
    required this.author,
    required this.authorImage,
    required this.category,
    required this.description,
    required this.contents,
  });

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  bool _showMore = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: default_,
      appBar: const AppBarWidget(
        title: "Course Detail",
        paddingController: 9,
        actions: [],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            _courseDetailsHeader(),
            _courseDescription(_showMore),
          ],
        ),
      ),
    );
  }

  _courseDetailsHeader() {
    return Positioned(
      top: 30,
      left: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image(
                    image: AssetImage("assets/images/diamond.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(width: 20),
                SizedBox(
                  height: 50,
                  width: 50,
                  child: Image(
                    image: AssetImage("assets/images/diamond.png"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 33),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.title,
                softWrap: true,
                style: const TextStyle(
                  color: light_100,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 17),
            TagDetail(tags: widget.category),
          ],
        ),
      ),
    );
  }

  _courseDescription(bool showMore) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: MediaQuery.of(context).size.height / 2 + 40,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: dark_100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Description',
                  style: TextStyle(color: light_100, fontSize: 12, height: 1),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.description[0],
                  softWrap: true,
                  style: const TextStyle(
                      color: light_100, fontSize: 14, height: 1.5),
                ),
                const SizedBox(height: 15),
                if (!_showMore)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showMore = true;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Show more',
                        style: TextStyle(color: primary, fontSize: 12),
                      ),
                    ),
                  ),
                if (_showMore)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.description.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0) {
                        // Skip the first paragraph, which is already displayed above
                        return const SizedBox.shrink();
                      } else {
                        return Column(
                          children: [
                            Text(
                              widget.description[index],
                              softWrap: true,
                              style: const TextStyle(
                                  color: light_100, fontSize: 14, height: 1.5),
                            ),
                            const SizedBox(height: 15),
                          ],
                        );
                      }
                    },
                  ),
                if (_showMore)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showMore = false;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Show less',
                        style: TextStyle(color: primary, fontSize: 12),
                      ),
                    ),
                  ),
                const Divider(
                  height: 35,
                  thickness: 2,
                  endIndent: 0,
                  color: dark_200,
                ),
                const Text(
                  'Author',
                  style: TextStyle(color: light_100, fontSize: 12, height: 1),
                ),
                const SizedBox(height: 15),
                _authorCard(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CourseContentList(
                                title: 'Course Content',
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: primary, width: 1),
                          ),
                          child: const Center(
                            child: Text(
                              'See Course',
                              style: TextStyle(
                                color: primary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => const CourseDetail(),
                          //   ),
                          // );
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'Join',
                              style: TextStyle(
                                color: light_100,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _authorCard() {
    bool _showMore = false;

    int _totalWords(List<String> textList) {
      return textList
          .map((text) => text.split(' ').length)
          .reduce((a, b) => a + b);
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(15),
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
                SizedBox(
                  height: 44,
                  width: 44,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(widget.authorImage),
                  ),
                  // add background image here
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.author,
                      style: const TextStyle(
                        color: light_100,
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Row(children: const [
                      Text(
                        '14 Courses',
                        style: TextStyle(
                          color: light_100,
                          fontFamily: 'DMSans',
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(width: 10),
                      // add separator
                      Text(
                        '·',
                        style: TextStyle(
                          color: light_100,
                          fontFamily: 'DMSans',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '14000 Students',
                        style: TextStyle(
                          color: light_100,
                          fontFamily: 'DMSans',
                          fontSize: 10,
                        ),
                      ),
                    ]),
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
