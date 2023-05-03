import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:feather_icons/feather_icons.dart';

class MyCourseCard extends StatefulWidget {
  const MyCourseCard({super.key});

  @override
  State<MyCourseCard> createState() => _MyCourseCardState();
}

class _MyCourseCardState extends State<MyCourseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
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
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Declarative interfaces for any Apple Devices',
                        style: TextStyle(
                          color: light_200,
                          fontFamily: 'DMSans',
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          // add icon star with filled color
                          Icon(
                            FeatherIcons.star,
                            color: primary,
                            size: 12,
                          ),

                          SizedBox(width: 5),
                          Text(
                            '4.5',
                            style: TextStyle(
                              color: light_200,
                              fontFamily: 'DMSans',
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          // add separator
                          Text(
                            '·',
                            style: TextStyle(
                              color: dark_300,
                              fontFamily: 'DMSans',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            'By John Doe',
                            style: TextStyle(
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
