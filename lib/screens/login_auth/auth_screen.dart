import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:learning_app/screens/main/nav_bar.dart';
import 'package:learning_app/screens/login_auth/signin_or_signup.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const Dashboard();
          }

          // user is NOT logged in
          else {
            return const RegisterLoginPage();
          }
        },
      ),
    );
  }
}
