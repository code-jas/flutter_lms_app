import 'package:flutter/material.dart';
import 'package:learning_app/screens/login_auth/sign_in.dart';
import 'package:learning_app/screens/login_auth/sign_up_screen.dart';

class RegisterLoginPage extends StatefulWidget {
  const RegisterLoginPage({super.key});

  @override
  State<RegisterLoginPage> createState() => RegisterLoginPageState();
}

class RegisterLoginPageState extends State<RegisterLoginPage> {
  bool showLogin = true;

  void toggleView() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginPage(
        onTap: toggleView,
      );
    } else {
      return RegisterPage(
        onTap: toggleView,
      );
    }
  }
}
