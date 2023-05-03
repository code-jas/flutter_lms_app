import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:feather_icons/feather_icons.dart';

class HeaderBar extends StatefulWidget {
  const HeaderBar({super.key});

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 80),
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: IntrinsicHeight(
            child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                image: DecorationImage(
                  image: AssetImage("assets/images/lappay_prof2.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              height: 40,
              width: 40,
              // add background image here
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: light_200,
                    fontFamily: 'DMSans',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'John A. Lappay',
                  style: TextStyle(
                    color: light_200,
                    fontFamily: 'DMSans',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )),
            // Notification Icon
            const Icon(
              FeatherIcons.bell,
              color: light_100,
            ),
          ],
        )));
  }
}
