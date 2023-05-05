import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:learning_app/models/UserProfile.dart';

// ignore: must_be_immutable
class HeaderBar extends StatefulWidget {
  GoogleUser googleUser;
  HeaderBar({super.key, required this.googleUser});

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
            SizedBox(
              height: 40,
              width: 40,
              child: CircleAvatar(
                backgroundImage: widget.googleUser.imageUrl != null
                    ? NetworkImage(widget.googleUser.imageUrl!)
                    : const AssetImage("assets/images/angelo_profi.jpg")
                        as ImageProvider<Object>,
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Welcome Back',
                  style: TextStyle(
                    color: light_200,
                    fontFamily: 'DMSans',
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.googleUser.name != ""
                      ? widget.googleUser.name
                      : "Angelo Silvestre",
                  style: const TextStyle(
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
