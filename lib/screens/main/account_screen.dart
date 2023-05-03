import 'package:flutter/material.dart';
import 'package:learning_app/constants/colors.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: dark_100,
      body: SizedBox(
        child: Center(
          child: Text(
            "Coming Soon",
            style: TextStyle(
              fontSize: 20,
              color: light_100,
            ),
          ),
        ),
      ),
    );
  }
}
