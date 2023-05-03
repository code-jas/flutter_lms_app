import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';

class LoginButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final Color? colorBtn;

  const LoginButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.colorBtn,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        // padding: const EdgeInsets.all(25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: colorBtn,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: light_100,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
