import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';
import 'package:feather_icons/feather_icons.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final int paddingController;

  const AppBarWidget({
    super.key,
    required this.title,
    required this.actions,
    required this.paddingController,
  });

  @override
  State<AppBarWidget> createState() => _AppBarWState();

  @override
  Size get preferredSize => const Size.fromHeight(53);
}

class _AppBarWState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(FeatherIcons.chevronLeft),
        padding: EdgeInsets.only(
          top: widget.paddingController.toDouble(),
          left: 25.0,
        ),
        onPressed: () {
          // back to previous screen
          if (widget.title == "Explore") {
            // print("Back to previous screen");
          } else {
            Navigator.pop(context);
          }
        },
      ),
      backgroundColor: default_,
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: EdgeInsets.only(top: widget.paddingController.toDouble()),
        child: Text(
          widget.title.length > 30
              ? '${widget.title.substring(0, 30)}...'
              : widget.title,
          style: const TextStyle(
            color: light_100,
            fontSize: 16,
          ),
        ),
      ),
      actions: widget.actions,
    );
  }
}
