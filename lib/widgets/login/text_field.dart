import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';

class LoginTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final String hintText;
  final bool obscureText;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          style: const TextStyle(
            color: light_100,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 5,
              bottom: 5,
              right: 20,
              left: 20,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: light_300),
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: light_100),
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            fillColor: Colors.transparent,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: light_100),
          ),
        ),
      ),
    );
  }
}
