import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:feather_icons/feather_icons.dart';

class CourseStatusCard extends StatefulWidget {
  const CourseStatusCard({super.key});

  @override
  State<CourseStatusCard> createState() => _CourseStatusCardState();
}

class _CourseStatusCardState extends State<CourseStatusCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: dark_200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: IntrinsicHeight(
        child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Declarative interfaces for any Apple Devices any Apple Device',
                      style: TextStyle(
                        color: light_200,
                        fontFamily: 'DMSans',
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Course Description',
                      style: TextStyle(
                        color: light_200,
                        fontFamily: 'DMSans',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 60,
                width: 60,
                child: const Icon(
                  Icons.play_arrow,
                  color: light_100,
                ),
              ), // Container Card Image
            ],
          ),
          const SizedBox(height: 10),
          Row(children: [
            Row(children: [
              Container(
                decoration: BoxDecoration(
                  color: default_,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 35,
                width: 35,
                child: const Icon(
                  FeatherIcons.award,
                  color: light_100,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Course Progress',
                    style: TextStyle(
                      color: light_200,
                      fontFamily: 'DMSans',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '50%',
                    style: TextStyle(
                      color: light_200,
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ]),
            const SizedBox(width: 20),
            Row(children: [
              Container(
                decoration: BoxDecoration(
                  color: default_,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 35,
                width: 35,
                child: const Icon(
                  FeatherIcons.award,
                  color: light_100,
                  size: 20,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Course Progress',
                    style: TextStyle(
                      color: light_200,
                      fontFamily: 'DMSans',
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '50%',
                    style: TextStyle(
                      color: light_200,
                      fontFamily: 'DMSans',
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ]),
          ]),
          const SizedBox(height: 20),
          // progress bar just container only and the color is success
          Container(
            decoration: BoxDecoration(
              color: dark_100,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 15,
            width: MediaQuery.of(context).size.width,
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: 0.3,
              child: Container(

                height: 15,
                decoration: BoxDecoration(
                  color: success,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
      )
    );
  }
}
